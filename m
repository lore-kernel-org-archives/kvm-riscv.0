From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 30 Jan 2023 08:13:20 +0000
Subject: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
In-Reply-To: <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
 <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
Message-ID: <Y9d8IBqXyep+PJTq@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 30, 2023 at 03:46:32PM +0800, Andy Chiu wrote:
> On Thu, Jan 26, 2023 at 5:04 AM Conor Dooley <conor@kernel.org> wrote:
> > Firstly, no-implicit-float is a CFLAG, so why add it to march?
> I placed it in march because I thought we need the flag in vdso. And,
> KBUILD_CFLAGS is not enough for vdso. However, I think we don't need
> this flag in vdso since it is run in user space anyway.
> > There is an existing patch on the list for enabling this flag, but I
> > recall Palmer saying that it was not actually needed?
> The flag is needed for clang builds to prevent auto-vectorization from
> using V in the kernel code [1].
> 
> > Palmer, do you remember why that was?
> The discussion[2] suggested that we need this flag, IIUC. But somehow
> the patch did make it into the tree.

I know, in [1] I left an R-b as the patch seemed reasonable to me.
Palmer mentioned some reason for not thinking it was actually needed but
not on-list, so I was hoping he'd comment!

And I suppose, it never got any further attention as it isn't needed by
any in-tree code?

> [1]https://lore.kernel.org/all/CAOnJCULtT-y9vo6YhW7bW9XyKRdod-hvFfr02jHVamR_LcsKdA at mail.gmail.com/
> [2]https://lore.kernel.org/all/20221216185012.2342675-1-abdulras at google.com/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230130/c4808e56/attachment-0001.sig>
