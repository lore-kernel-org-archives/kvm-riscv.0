From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri, 09 Feb 2024 18:27:32 +1000
Subject: [kvm-unit-tests PATCH v3 2/8] arch-run: Clean up initrd cleanup
In-Reply-To: <9fb2f113-db36-41a6-a6f2-0499f28ace0a@redhat.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-3-npiggin@gmail.com>
 <9fb2f113-db36-41a6-a6f2-0499f28ace0a@redhat.com>
Message-ID: <CZ0EMJ56C8WS.1RRW73R6KWDEQ@wheely>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri Feb 9, 2024 at 5:32 PM AEST, Thomas Huth wrote:
> On 09/02/2024 08.01, Nicholas Piggin wrote:
> > Rather than put a big script into the trap handler, have it call
> > a function.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   scripts/arch-run.bash | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index 11d47a85..1e903e83 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -269,10 +269,21 @@ search_qemu_binary ()
> >   	export PATH=$save_path
> >   }
> >   
> > +initrd_cleanup ()
> > +{
> > +	rm -f $KVM_UNIT_TESTS_ENV
> > +	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
> > +		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
> > +	else
> > +		unset KVM_UNIT_TESTS_ENV
> > +		unset KVM_UNIT_TESTS_ENV_OLD
> > +	fi
> > +}
>
> Looking at the original code below, shouldn't this rather unset 
> KVM_UNIT_TESTS_ENV_OLD after the "fi" statement?

Yes good catch.

Thanks,
Nick

