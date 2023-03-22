From: Conor Dooley <conor@kernel.org>
Date: Wed, 22 Mar 2023 20:05:11 -0000
Subject: [PATCH] riscv: require alternatives framework when selecting FPU
 support
In-Reply-To: <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
Message-ID: <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 22, 2023 at 07:44:13PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> > On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> 
> > > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
> > > >  can defer that wedding a bit longer.)
> > > 
> > > At that point, the config option should just go away entirely, no?
> > 
> > Ah, yes, and that makes the idea even more attractive, as we could remove
> > several ifdefs.
> 
> I went and did the cursory check, it's not compatible with XIP_KERNEL so
> dropping the option entirely probably isn't a possibility :/

What I said is only now sinking in. We're now going to be disabling FPU
support on XIP kernels with this patch.
Well, technically not this patch since it wouldn't have built without
Jason's changes, but that doesn't seem like the right thing to do...


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230322/6df7ae3c/attachment-0001.sig>
