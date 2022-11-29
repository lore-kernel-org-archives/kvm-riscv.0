From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 29 Nov 2022 06:21:39 +0100
Subject: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
In-Reply-To: <20221128161424.608889-7-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-7-apatel@ventanamicro.com>
Message-ID: <20221129052139.t7txrey3u45ssl2u@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 09:44:21PM +0530, Anup Patel wrote:
> The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
> can be used by KVM module so let us export these functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/sbi.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

