<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">My works</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseWork" role="button"
       aria-expanded="true" aria-controls="collapseWork">
        Add new work
    </a>
    <div class="card-top">
        <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
           data-toggle="collapse" href="#collapsePart" role="button"
           aria-expanded="true" aria-controls="collapsePart">
            Add new part
        </a>
    </div>
    <div class="collapse mb-3" id="collapsePart" style="">
        <form action="/work/add_part" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="destWork">Choose work</label>
                <select name="src" id="src">
                    <#list works as product>
                        <option value="${product}">${product.getTitle()}</option>
                    </#list>
                </select>
            </div>
            <div class="form-group">
                <label for="partName">Title</label>
                <input type="text" required class="form-control"
                       id="partName" name="title_part">
            </div>
            <div class="form-group">
                <label for="content_part">Content of part</label>
                <textarea required class="form-control" id="content_part" name="content_part">Write here...</textarea>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="width: 100%" class="btn btn-dark">Add part</button>
        </form>
    </div>

    <div class="collapse mb-3" id="collapseWork" style="">
        <form action="/work/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Title</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Add work</button>
        </form>
    </div>

    <div class="card-columns">
        <#list works as product>
            <a href="/work/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <div class="card-top">
                        <form action="/work/delete/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Delete Work
                            </button>
                        </form>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${product.getTitle()}</h5>
                    </div>
                </div>

            </a>
        <#else>
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>
</@t.template>