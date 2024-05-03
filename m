From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri, 03 May 2024 15:11:44 +1000
Subject: [kvm-unit-tests PATCH v3 0/5] add shellcheck support
In-Reply-To: <20240502-d231f770256b3ed812eb4246@orel>
References: <20240501112938.931452-1-npiggin@gmail.com>
 <2be99a78-878c-4819-8c42-1b795019af2f@redhat.com>
 <20240502-d231f770256b3ed812eb4246@orel>
Message-ID: <D0ZR2DC2DZ16.1TSDQF6S4AJWU@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu May 2, 2024 at 6:56 PM AEST, Andrew Jones wrote:
> On Thu, May 02, 2024 at 10:23:22AM GMT, Thomas Huth wrote:
> > On 01/05/2024 13.29, Nicholas Piggin wrote:
> > > This is based on upstream directly now, not ahead of the powerpc
> > > series.
> > 
> > Thanks! ... maybe you could also rebase the powerpc series on this now? (I
> > haven't forgotten about it, just did not find enough spare time for more
> > reviewing yet)
> > 
> > > Since v2:
> > > - Rebased to upstream with some patches merged.
> > > - Just a few comment typos and small issues (e.g., quoting
> > >    `make shellcheck` in docs) that people picked up from the
> > >    last round.
> > 
> > When I now run "make shellcheck", I'm still getting an error:
> > 
> > In config.mak line 16:
> > AR=ar
> > ^-- SC2209 (warning): Use var=$(command) to assign output (or quote to
> > assign string).
>
> I didn't see this one when testing. I have shellcheck version 0.9.0.
>
> > 
> > Not sure why it's complaining about "ar" but not about the other lines in there?
> > 
> > Also, it only seems to work for in-tree builds. If I run it from an
> > out-of-tree build directory, I get:
> > 
> > */efi/run: */efi/run: openBinaryFile: does not exist (No such file or directory)
>
> I'm glad you checked this. I wish I had before merging :-/

I'll send a patch. Possibly some other targets (check-kerneldoc, ctags?)
may not work out of tree either. I'll fix this one up first though.

Thanks,
Nick

