From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 5 Apr 2024 10:33:48 -0700
Subject: [PATCH 0/5] Add parsing for Zimop ISA extension
In-Reply-To: <20240405-091c6c174f023d74b434059d@orel>
References: <20240404103254.1752834-1-cleger@rivosinc.com> <20240405-091c6c174f023d74b434059d@orel>
Message-ID: <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 5, 2024 at 8:26?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Apr 04, 2024 at 12:32:46PM +0200, Cl?ment L?ger wrote:
> > The Zimop ISA extension was ratified recently. This series adds support
> > for parsing it from riscv,isa, hwprobe export and kvm support for
> > Guest/VM.
>
> I'm not sure we need this. Zimop by itself isn't useful, so I don't know
> if we need to advertise it at all. When an extension comes along that
> redefines some MOPs, then we'll advertise that extension, but the fact
> Zimop is used for that extension is really just an implementation detail.

Only situation I see this can be useful is this:--

An implementer, implemented Zimops in CPU solely for the purpose that they can
run mainline distro & packages on their hardware and don't want to leverage any
feature which are built on top of Zimop.

As an example zicfilp and zicfiss are dependent on zimops. glibc can
do following

1) check elf header if binary was compiled with zicfiss and zicfilp,
if yes goto step 2, else goto step 6.
2) check if zicfiss/zicfilp is available in hw via hwprobe, if yes
goto step 5. else goto step 3
3) check if zimop is available via hwprobe, if yes goto step 6, else goto step 4
4) This binary won't be able to run successfully on this platform,
issue exit syscall. <-- termination
5) issue prctl to enable shadow stack and landing pad for current task
<-- enable feature
6) let the binary run <-- let the binary run because no harm can be done

