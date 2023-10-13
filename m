From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 13 Oct 2023 11:58:14 +0200
Subject: [PATCH 4/5] riscv: Suffix all page table entry pointers with 'p'
In-Reply-To: <20231012-exclusion-moaner-d26780f9eb00@spud>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
 <20231002151031.110551-5-alexghiti@rivosinc.com>
 <20231012-envision-grooving-e6e0461099f1@spud>
 <20231012-exclusion-moaner-d26780f9eb00@spud>
Message-ID: <20231013-19d487ddc6b6efd6d6f62f88@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 12, 2023 at 12:35:00PM +0100, Conor Dooley wrote:
> On Thu, Oct 12, 2023 at 12:33:15PM +0100, Conor Dooley wrote:
> > Hey Alex,
> > 
> > On Mon, Oct 02, 2023 at 05:10:30PM +0200, Alexandre Ghiti wrote:
> > > That makes it more clear what the underlying type is, no functional
> > > changes intended.
> > 
> > Scanning through stuff on patchwork, this really doesn't seem worth the
> > churn. I thought this sort of Hungarian notation-esque stuff was a
> > relic of a time before I could read & our docs even go as far as to
> 
> s/go/went/, I see the language got changed in more recent releases of
> the kernel!

The documentation seems to still be against it, but, despite that and
the two very valid points raised by Marco (backporting and git-blame),
I think ptep is special and I'm mostly in favor of this change. We may
not need to s/r every instance, but certainly functions which need to
refer to both the pte and the ptep representations of entries becomes
more clear when using the 'p' convention (and then it's nice to have
ptep used everywhere else too for consistency...)

Anyway, just my 2 cents.

Thanks,
drew

