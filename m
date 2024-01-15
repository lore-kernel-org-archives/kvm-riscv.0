From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Jan 2024 16:56:36 +0100
Subject: [PATCH 13/15] KVM: riscv: selftests: Add Zvfh[min] extensions to
 get-reg-list test
In-Reply-To: <20231128145357.413321-14-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-14-apatel@ventanamicro.com>
Message-ID: <20240115-317ad6428b5add2b27617f35@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 28, 2023 at 08:23:55PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zvfh[min] extensions for Guest/VM so let us
> add these extensions to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

