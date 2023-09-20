From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Sep 2023 17:59:07 +0200
Subject: [PATCH v2 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
In-Reply-To: <20230920154608.1447057-5-apatel@ventanamicro.com>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
 <20230920154608.1447057-5-apatel@ventanamicro.com>
Message-ID: <20230920-e3fc5272a2818c67a17cd90c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 09:16:08PM +0530, Anup Patel wrote:
> Currently the AIA ONE_REG registers are reported by get-reg-list
> as new registers for various vcpu_reg_list configs whenever Ssaia
> is available on the host because Ssaia extension can only be
> disabled by Smstateen extension which is not always available.
> 
> To tackle this, we should filter-out AIA ONE_REG registers only
> when Ssaia can't be disabled for a VCPU.
> 
> Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I guess you missed my reply to myself where I corrected my analysis and
gave an r-b. Anyway, here it is again, and thanks for fixing up the nits.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

