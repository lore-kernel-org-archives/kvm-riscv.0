From: Conor Dooley <conor@kernel.org>
Date: Tue, 9 Apr 2024 16:49:02 +0100
Subject: [PATCH RFC 02/11] dt-bindings: riscv: Add Sdtrig optional CSRs
 existence on DT
In-Reply-To: <20240405-ebdb2943657ab08d2d563c03@orel>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-2-1534f93b94a7@sifive.com>
 <20240329-affidavit-anatomist-1118a12c3e60@wendy>
 <20240405-ebdb2943657ab08d2d563c03@orel>
Message-ID: <20240409-princess-hypnotic-7fd89aafa31d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 05:59:41PM +0200, Andrew Jones wrote:
> On Fri, Mar 29, 2024 at 10:31:10AM +0000, Conor Dooley wrote:
> > On Fri, Mar 29, 2024 at 05:26:18PM +0800, Max Hsu wrote:
> > > The mcontext/hcontext/scontext CSRs are optional in the Sdtrig extension,
> > > to prevent RW operations to the missing CSRs, which will cause
> > > illegal instructions.
> > > 
> > > As a solution, we have proposed the dt format for these CSRs.
> > 
> > As I mentioned in your other patch, I amn't sure what the actual value
> > is in being told about "sdtrig" itself if so many of the CSRs are
> > optional. I think we should define pseudo extensions that represent
> > usable subsets that are allowed by riscv,isa-extensions, such as
> > those you describe here: sdtrig + mcontext, sdtrig + scontext and
> > sdtrig + hcontext. Probably also for strig + mscontext. What
> > additional value does having a debug child node give us that makes
> > it worth having over something like the above?
> 
> Yeah, Sdtrig, which doesn't tell you what you get, isn't nice at all.
> I wonder if we can start with requiring Sdtrig to be accompanied by
> Ssstrict in order to enable the context CSRs, i.e.
> 
>  Sdtrig          - support without optional CSRs
>  Sdtrig+Ssstrict - probe for optional CSRs, support what's found
> 
> If there are platforms with Sdtrig and optional CSRs, but not Ssstrict,
> then maybe the optional CSRs can be detected in some vendor-specific way,
> where the decision as to whether or not that vendor-specific way is
> acceptable is handled case-by-case.

I think it's pretty reasonable to make sstrict a requirement for the
kernel's use of sdtrig. If we have some non-sstrict systems that do
implement these particular CSRs, then I guess we can add some psuedo
instructions then (and nothing would stop the sstrict systems also
specifying directly). If they're using some non-standard CSRs then
case-by-case I guess.

I'm just specifically not keen on adding extra dt properties that do
things we can already do with the ones we have!
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240409/7a06481e/attachment.sig>
