From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 28 Jul 2023 11:43:32 +0200
Subject: [PATCH 1/4] tools: riscv: Add header file csr.h
In-Reply-To: <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
Message-ID: <20230728-879500f157954d849fb303ec@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 03:20:05PM +0800, Haibo Xu wrote:
> Borrow some of the csr definitions and operations from kernel's
> arch/riscv/include/asm/csr.h to tools/ for riscv.

You should copy the entire file verbatim.

Thanks,
drew

