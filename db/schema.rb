# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_31_203245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "biographies", force: :cascade do |t|
    t.string "userId"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentId"
    t.integer "postId"
    t.integer "posterId"
    t.date "commentDate"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "groupId"
    t.integer "leaderInt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interests", force: :cascade do |t|
    t.integer "userId"
    t.string "phone"
    t.string "nationality"
    t.string "state"
    t.string "community"
    t.integer "numPrereqs"
    t.string "scholarship"
    t.string "faveMovieGenre"
    t.string "potentialRoles"
    t.integer "numWorkExp"
    t.string "usedTech"
    t.string "projects"
    t.string "extracurric"
    t.string "pastWorkExp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "postId"
    t.integer "posterId"
    t.date "postDate"
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "profileId"
    t.integer "userId"
    t.string "year"
    t.string "picture"
    t.string "contactInfo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "studentId"
    t.integer "groupId"
    t.integer "insterestsId"
    t.integer "profileId"
    t.boolean "isOfficer"
    t.boolean "isAdmin"
    t.string "fullName"
    t.string "avatarUrl"
    t.string "tamuEmail"
    t.date "dateOfBirth"
    t.boolean "gradAssistance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
