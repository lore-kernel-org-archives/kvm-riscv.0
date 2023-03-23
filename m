From: Conor Dooley <conor@kernel.org>
Date: Thu, 23 Mar 2023 22:20:05 -0000
Subject: [PATCH] riscv: require alternatives framework when selecting FPU
 support
In-Reply-To: <ZBx2qFFiaRSyJubo@zx2c4.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
 <af690061-f962-498e-b2df-d2e6119292cf@spud>
 <ZBx2qFFiaRSyJubo@zx2c4.com>
Message-ID: <71fc0b56-0b63-4f0b-9f1d-5c4d6102ded6@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Jason,

I read this mail before I left work today & had a think about it on the
bike home, and had a whole response thought out, got distracted and
forgot it all.. Hopefully I've remembered everything I had to say!

On Thu, Mar 23, 2023 at 04:56:24PM +0100, Jason A. Donenfeld wrote:
> On Thu, Mar 23, 2023 at 02:49:34PM +0000, Conor Dooley wrote:
> > This would requiring picking up your patch Jason, but with an
> > "if !XIP_KERNEL" added to the select.
> 
> So the risk of making this all work is that we wind up forgetting to add
> `select alternatives if !xip` to various places that need it (fpu, kvm,
> maybe others? future others?), because it appears to work, thanks to the
> code in your patch.
> 
> But making it work is also probably a good thing, since we obviously
> want the fpu and maybe other things to work on xip kernels.

I'm not super pushed about the "maybe other things", since the "maybe
other things" that are in my head (errata and recently added extensions)
have never worked on xip kernels, and losing them isn't a regression.
Since XIP_KERNEL is deemed to be a "NONPORTABLE" option, we wouldn't
need alternatives to enable it for them, but changes would be required
for that to make the alternatives collapse to a build time thing.
Can deal with that iff someone actually does come along wanting it.

We do need to fix this so that situations like the one you hit can't
happen, while not regressing the level of support for xip, so some level
of "making it work" is needed, but I do agree that it needs to be done
in a less footgun way.

> So maybe we should get rid of the CONFIG_RISCV_ALTERNATIVES knob
> entirely, making it "always enabled", and then conditonalize the
> alternatives code to BUILD_BUG_ON when called with CONFIG_XIP_KERNEL=y.
> Then, this build bug will get hit immediately by
> riscv_has_extension_*(), which will then require your patch, which can
> run in a `if (IS_ENABLED(XIP_KERNEL))` block or similar.
> 
> The result of that will be:
> - !xip kernels properly use the fast riscv_has_extension_*() code and
>   any alternatives code needed, since it's always selected.
> - xip kernels get a BUILD_BUG_ON if they use any alternatives-based code
>   that doesn't have a xip fallback yet.
> 
> What do you think of that approach?

Initially I thought "great, lets always enable the alternatives
framework" but I don't think we can do that.
For the has_extension() stuff a fallback is fine, but I don't think that
applies to using alternatives for either errata or enabling extensions
at runtime.
I just don't really want to go through and modify the alternative macros
so that they're evaluated at build time for xip unless that is
absolutely required down the line. (I'd rather not even do it at all.)

Most of the things that are currently selecting RISCV_ALTERNATIVE do so
to patch in support for extensions or enable errata, and I don't think
we should expose those config options if the alternatives that they rely
on cannot be used. I think that means something like...

> A "lighter weight" version of that approach would be to just remove all of
> the `select RISCV_ALTERNATIVES` lines, and instead make
> RISCV_ALTERNATIVES specify `default !XIP_KERNEL`. That would more or
> less amount to the above too, though with weirder error cases.

...adding a "select RISCV_ALTERNATIVE if !XIP_KERNEL" to the
CONFIG_RISCV entry, and similarly to what you suggest here, swapping all
of the instances of "select RISCV_ALTERNATIVE" for "depends on
RISCV_ALTERNATIVE". That does still mean we can drop all of the
"depends on !XIP_KERNEL" that are littered around the place whereever we
are using alternatives & should only get the slow path for extension
checking for xip kernels.
That'd handle the issue that you pointed out, where if the select is
missing, my suggested change makes it appear to work if alternatives are
not enabled too.

The BUILD_BUG_ON idea is good too, probably not fixes material, but
might be worth having to prevent alternatives somehow being used when
XIP_KERNEL is set.

I'll try to whip something up tomorrow...

Thanks Jason,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230323/6f9ebd90/attachment-0001.sig>
