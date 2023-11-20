From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Nov 2023 14:09:17 +0000
Subject: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
In-Reply-To: <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
Message-ID: <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 08, 2023 at 05:08:01PM -0800, Anish Moorthy wrote:
> Applying [1] and [2] reveals that this also breaks non-x86 builds- the
> MEM_REGION_GPA/SLOT definitions are guarded behind an #ifdef
> __x86_64__, while the usages introduced here aren't.
> 
> Should
> 
> On Sun, Nov 5, 2023 at 8:35?AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > +       test_invalid_memory_region_flags();
> 
> be #ifdef'd, perhaps? I'm not quite sure what the intent is.

This has been broken in -next for a week now, do we have any progress
on a fix or should we just revert the patch?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231120/f5db95b2/attachment.sig>
