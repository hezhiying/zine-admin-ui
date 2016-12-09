<div class="console-container" id="vue-table">
    <div class="console-title console-title-border">
        <div class="pull-left">
            <h5>
                表格组件 </h5>
        </div>
        <div class="pull-right">
            <button type="button" class="btn btn-default "></button>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <form action="/zine/home/data" method="get" class="form-inline" role="form" @submit.prevent="submit">
                <div class="form-group">
                    <label class="sr-only" for="">label</label>
                    <input type="email" class="form-control" name="key" id="" placeholder="Input ..." :model="form.key">
                </div>
                <div class="form-group">
                    <template>
                        <div class="block">
                            <span class="demonstration">默认</span>
                            <el-date-picker
                                    v-model="form.date1"
                                    type="date"
                                    placeholder="选择日期"
                                    >
                            </el-date-picker>
                        </div>
                    </template>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th v-for="field in fields">
                        {{ fun1(field) }}
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="data in datas">
                    <td v-if="data.id">
                        <a href="{'afasd'|app}" @click.prevent="fun2" data-confirm="adf">aaaaa</a> {{ data.id }}
                    </td>
                    <td v-if="data.name">{{ data.name }}</td>
                    <td v-if="data.title">{{ data.title }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                    Dropdown
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation" class="dropdown-header">Dropdown header</li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                    <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Something else
                            here</a></li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation" class="dropdown-header">Dropdown header</li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                </ul>
            </div>
            <div class="console-title">
                <div class="pull-left">
                    <h5>
                        dfasdf </h5>
                </div>
                <div class="pull-right">
                    <button type="button" class="btn btn-default "></button>
                </div>
            </div>
            <a class="btn btn-primary" data-toggle="modal" href="#modal-id">Trigger modal</a>
            <div class="modal fade" id="modal-id">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            Modal body ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <table class="layui-table table table-hover" lay-even="" lay-skin="nob">
                <thead>
                <tr>
                    <th width="10"><input type="checkbox"></th>
                    <th>人物</th>
                    <th>民族</th>
                    <th>出场时间</th>
                    <th>格言</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>贤心</td>
                    <td>汉族</td>
                    <td>1989-10-14</td>
                    <td>人生似修行</td>
                </tr>
                <tr class="warning">
                    <td><input type="checkbox"></td>
                    <td>张爱玲</td>
                    <td>汉族</td>
                    <td>1920-09-30</td>
                    <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                </tr>
                <tr class="active">
                    <td><input type="checkbox"></td>
                    <td>Helen Keller</td>
                    <td>拉丁美裔</td>
                    <td>1880-06-27</td>
                    <td> Life is either a daring adventure or nothing.</td>
                </tr>
                <tr class="success">
                    <td><input type="checkbox"></td>
                    <td>岳飞</td>
                    <td>汉族</td>
                    <td>1103-北宋崇宁二年</td>
                    <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
                </tr>
                <tr class="danger">
                    <td><input type="checkbox"></td>
                    <td>孟子</td>
                    <td>华夏族（汉族）</td>
                    <td>公元前-372年</td>
                    <td>猿强，则国强。国强，则猿更强！</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function fun1(val) {
        return val + '4444';
    }
    function fun2() {
        alert('test');

    }
    var app = new Vue({
        'el'     : '#vue-table',
        data     : {

            form  : {
                'date1':'',
                'url': '/zine/home/data',
                'key'  : '',
                'page':1,
                'limit':20,
                'order_fields':''
            },
            fields: [
                'col-1', 'col-2'
            ],
            datas : [
                {
                    id   : 1,
                    name : 'aaaa',
                    title: 'titel-1'

                }, {
                    id   : 2,
                    name : 'bbbb',
                    title: 'title-2'
                }
            ]
        },
        'methods': {
            'loadPage':function ( page ) {
                this.form.page = page;
                this.ajax();
            },
            'changeLimit':function ( limit ) {
                this.form.limit = limit;
                this.ajax();
            },
            'ajax': function () {
                var that = this;
                $.getJSON(that.form.url,that.form);
            },
            'submit':function () {
                this.form.page = 1;
                this.ajax();
            }
        }
    });

</script>