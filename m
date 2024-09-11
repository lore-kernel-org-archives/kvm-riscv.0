From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 10:21:41 +0200
Subject: [kvm-unit-tests PATCH v2 2/4] Makefile: Prepare for clang EFI
 builds
In-Reply-To: <D430XMRU4FZD.1FFPMW6WVWRSD@gmail.com>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-8-andrew.jones@linux.dev>
 <D430XMRU4FZD.1FFPMW6WVWRSD@gmail.com>
Message-ID: <20240911-7187cf8364de8a30b0419fac@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 10:21:39AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> > clang complains about GNU extensions such as variable sized types not
> > being at the end of structs unless -Wno-gnu is used. We may
> > eventually want -Wno-gnu, but for now let's just handle the warnings
> > as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
> > the warning issued for the initrd_dev_path struct.
> 
> You could also make a variant of struct efi_vendor_dev_path with no
> vendordata just for initrd_dev_path?
> 
> It's taken from Linux or some efi upstream though so maybe it's annoying
> to make such changes here. Okay in that case since it's limited to EFI.

I should have mentioned in the commit message that efi_vendor_dev_path is
a direct import of the Linux code and that we'd rather keep it that way.
I can do that for v2.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
drew

> 
> 
> >
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  Makefile | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 3d51cb726120..7471f7285b78 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -50,6 +50,8 @@ EFI_CFLAGS += -fshort-wchar
> >  # EFI applications use PIC as they are loaded to dynamic addresses, not a fixed
> >  # starting address
> >  EFI_CFLAGS += -fPIC
> > +# Avoid error with the initrd_dev_path struct
> > +EFI_CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
> >  # Create shared library
> >  EFI_LDFLAGS := -Bsymbolic -shared -nostdlib
> >  endif
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

