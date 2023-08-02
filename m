From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 2 Aug 2023 10:05:00 +0800
Subject: [PATCH 1/4] tools: riscv: Add header file csr.h
In-Reply-To: <20230728-879500f157954d849fb303ec@orel>
References: <cover.1690364259.git.haibo1.xu@intel.com> <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
 <20230728-879500f157954d849fb303ec@orel>
Message-ID: <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 28, 2023 at 5:43?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jul 27, 2023 at 03:20:05PM +0800, Haibo Xu wrote:
> > Borrow some of the csr definitions and operations from kernel's
> > arch/riscv/include/asm/csr.h to tools/ for riscv.
>
> You should copy the entire file verbatim.
>

Ok, will copy all the definitions in the original csr.h

> Thanks,
> drew

