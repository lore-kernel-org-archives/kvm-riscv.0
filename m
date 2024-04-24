From: Conor Dooley <conor@kernel.org>
Date: Wed, 24 Apr 2024 08:40:08 +0100
Subject: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension
 description
In-Reply-To: <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-3-cleger@rivosinc.com>
 <20240423-poser-splashed-56ab5340af48@spud>
 <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
Message-ID: <20240424-rehydrate-sloppy-62132c72fe18@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 24, 2024 at 09:20:35AM +0200, Cl?ment L?ger wrote:
> 
> 
> On 23/04/2024 18:30, Conor Dooley wrote:
> > On Thu, Apr 18, 2024 at 04:26:41PM +0200, Cl?ment L?ger wrote:
> >> Add description for the Ssdbltrp ISA extension which is not yet
> >> ratified.
> >>
> >> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> index 63d81dc895e5..ce7021dbb556 100644
> >> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> @@ -147,6 +147,12 @@ properties:
> >>              and mode-based filtering as ratified at commit 01d1df0 ("Add ability
> >>              to manually trigger workflow. (#2)") of riscv-count-overflow.
> >>  
> >> +        - const: ssdbltrp
> >> +          description: |
> >> +            The standard Ssdbltrp supervisor-level extension for double trap
> >> +            handling as currently defined by commit e85847b ("Merge pull request
> >> +            #32 from ved-rivos/0415_1 ") of riscv-double-trap.
> > 
> > I see the proposed ratification for this is Sept 2024, and is marked as
> > "Freeze Approved". Do you know when it is going to be frozen? Until
> > this, I can't ack this patch. I had a look in the RVI JIRA
> > https://jira.riscv.org/browse/RVS-2291?src=confmacro
> > and it looks imminent, but it's unclear to me whether it actually has
> > been or not.
> 
> Hi Conor,
> 
> Yeah, this series is a RFC since the spec is not yet ratified nor frozen
> and its purpose is actually to get to a frozen state. As to when this
> will be ratified, I guess Ved can probably answer that.

Usually I'd just not ack the RFC patches, but I do at least check how
far they might be from frozen before I move on, The jira for this one
says "Actual ARC Freeze Approval:	18/Apr/24", which made me think
a freeze was gonna happen soon.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240424/96696a63/attachment-0001.sig>
