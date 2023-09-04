From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 4 Sep 2023 15:26:41 +0200
Subject: [PATCH v2 3/8] tools: riscv: Add header file csr.h
In-Reply-To: <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
Message-ID: <20230904-79306f36fc9cbe222eb0ef8f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 02, 2023 at 08:59:25PM +0800, Haibo Xu wrote:
> Borrow the csr definitions and operations from kernel's
> arch/riscv/include/asm/csr.h to tools/ for riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/arch/riscv/include/asm/csr.h | 521 +++++++++++++++++++++++++++++
>  1 file changed, 521 insertions(+)
>  create mode 100644 tools/arch/riscv/include/asm/csr.h
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

