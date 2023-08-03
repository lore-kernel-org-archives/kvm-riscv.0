From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 3 Aug 2023 19:56:10 +0300
Subject: [PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg error code
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
Message-ID: <20230803-2e2c22d06763eb9caedade6f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 03, 2023 at 01:32:52PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version includes a diff that Andrew mentioned in v2 [1] that I
> missed. They were squashed into patch 1.
> 
> No other changes made. Patches rebased on top of riscv_kvm_queue.
> 
> Changes from v3:
> - patch 1:
>   - added missing EINVAL - ENOENT conversions
> - v3 link: https://lore.kernel.org/kvm/20230803140022.399333-1-dbarboza at ventanamicro.com/
> 
> [1] https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza at ventanamicro.com/
> 
>

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

