From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 20:25:03 +0000
Subject: [PATCH v3 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <3268358.687JKscXgg@diego>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-2-jszhang@kernel.org>
 <3268358.687JKscXgg@diego>
Message-ID: <Y8Bsn5Q0HYMNOt/R@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 12:31:59AM +0100, Heiko St?bner wrote:
> Am Mittwoch, 11. Januar 2023, 18:10:15 CET schrieb Jisheng Zhang:
> > Alternatives live in a different section, so offsets used by jal
> > instruction will point to wrong locations after the patch got applied.
> > 
> > Similar to arm64, adjust the location to consider that offset.
> > 
> > Co-developed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> looks good, thanks for fixing the issues Andrew and Conor pointed
> out in the variant in my zbb series. I've now switched over to this one.
> 
> I guess as you said, we really should separate this out into a single patch
> [or if Palmer is fine with that, just pick this one patch to apply until the
> rest is ready]

Splitting it out may make it easier to flag for him during the pw sync
next week? Either way, I'm fine w/ it..

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/1e4a4edb/attachment-0001.sig>
