From: Guo Ren <guoren@kernel.org>
Date: Wed, 2 Aug 2023 23:13:34 -0400
Subject: [PATCH 1/4] tools: riscv: Add header file csr.h
In-Reply-To: <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
 <20230728-879500f157954d849fb303ec@orel>
 <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
Message-ID: <ZMsbXk4JU/Ung7qu@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 02, 2023 at 10:05:00AM +0800, Haibo Xu wrote:
> On Fri, Jul 28, 2023 at 5:43?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Jul 27, 2023 at 03:20:05PM +0800, Haibo Xu wrote:
> > > Borrow some of the csr definitions and operations from kernel's
> > > arch/riscv/include/asm/csr.h to tools/ for riscv.
> >
> > You should copy the entire file verbatim.
> >
> 
> Ok, will copy all the definitions in the original csr.h
Why not include the original one? Maintain the one csr.h is more
comfortable.
> 
> > Thanks,
> > drew
> 

