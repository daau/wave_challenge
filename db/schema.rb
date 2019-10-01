# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_27_183427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_group_hourly_wages", force: :cascade do |t|
    t.bigint "employee_group_id"
    t.decimal "hourly_wage", precision: 6, scale: 2
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_group_id"], name: "index_employee_group_hourly_wages_on_employee_group_id"
  end

  create_table "employee_groups", force: :cascade do |t|
    t.string "name"
    t.integer "hourly_wage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_employee_groups_on_name"
  end

  create_table "employees", force: :cascade do |t|
    t.string "long_id"
    t.bigint "employee_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_group_id"], name: "index_employees_on_employee_group_id"
    t.index ["long_id"], name: "index_employees_on_long_id"
  end

  create_table "pay_periods", force: :cascade do |t|
    t.bigint "employee_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_group_hourly_wages_id"
    t.index ["employee_group_hourly_wages_id"], name: "index_pay_periods_on_employee_group_hourly_wages_id"
    t.index ["employee_id"], name: "index_pay_periods_on_employee_id"
    t.index ["end_date"], name: "index_pay_periods_on_end_date"
    t.index ["start_date"], name: "index_pay_periods_on_start_date"
  end

  create_table "shift_reports", force: :cascade do |t|
    t.string "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_shift_reports_on_report_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "shift_report_id"
    t.bigint "pay_period_id"
    t.date "date_worked"
    t.decimal "hours_worked", precision: 3, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_worked"], name: "index_shifts_on_date_worked"
    t.index ["employee_id"], name: "index_shifts_on_employee_id"
    t.index ["pay_period_id"], name: "index_shifts_on_pay_period_id"
    t.index ["shift_report_id"], name: "index_shifts_on_shift_report_id"
  end

end
