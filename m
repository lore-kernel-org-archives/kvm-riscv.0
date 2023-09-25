From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 25 Sep 2023 16:16:09 +0200
Subject: [PATCH v2 9/9] KVM: riscv: selftests: Add condops extensions to
 get-reg-list test
In-Reply-To: <20230925133859.1735879-10-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-10-apatel@ventanamicro.com>
Message-ID: <20230925-3ceb6ef98455349935bcd504@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 25, 2023 at 07:08:59PM +0530, Anup Patel wrote:
> We have a new conditional operations related ISA extensions so let us
> add these extensions to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

