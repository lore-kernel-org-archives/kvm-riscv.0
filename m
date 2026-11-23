Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FF606A338
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RU2NEnfZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTdZLh/o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Z+VYLQfGLe4CfQw1ZAlZLzCIuD/dgjVc1W1tKs9W6Y=; b=RU2NEnfZ5GoMr00dS5HGPJKLFH
	3J+0AnYEHe2RFZgEH+HVPOMx+VKbxjG8ryLwA8dU3rKh2F7zUV55VVlq1OYQnus6od9q/LRGmtV6Q
	5UnjHVWmvEvGihB0j2sb7rVPUV9BUnkp5NGe59P3lIZOe4norQ1dBMqaBeQdh7IOZpyNWmqm7Akv6
	sxF1qXcHi8sa6F0yhZ5f317m7iclCJ+O1+LrL7qNS3DBrcMT3HjwSz+YfVHjok4rCRQ66JRbZJldP
	gCUyKB6uVILCTt+/1fZop5tGwJlNJOKvXNYdYQbw8Ao+2FvLQiz1Ck2MJxmkqKXWEaCCaQ/aIwMIG
	LJslgNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW1T-00000003zst-3k5a;
	Mon, 23 Nov 2026 15:32:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW1T-00000003zsW-0Hij
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 15:32:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 816E3622F4;
	Mon, 23 Nov 2026 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83C61F000CF;
	Mon, 23 Nov 2026 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447922;
	bh=IcrKa5wszJlz7KzbvkJ6LYVb8H5e9hHDr4RZJLHWMyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTdZLh/oKelhDZHb27a8Rjnsbjd5T8QMS1HZ8GXSbzFfWDBRtRlPqH4ej2BHiOxGp
	 WYaG6MaU2vMTrbJ2jSAAcXK9hewWa08MSj8aSICWcGhhEsVOS7vtEyJuqDySVj2hk2
	 Dkbnv40jW4fYWr27uMMqSLIBFptb63TGD5lwieU/2Yct6tGqap3hZNpP0fJ8syioa/
	 Bcv7nFUbzMX561fxkGAC1Fjoy5qVB1c4rTAaAEm4FZQKOlm8aqCDLyYqU9w5h9LWcw
	 0CHylaAYpxeKP3qe2jsGkle32VHGhSGNKBQ2rXU8WUrZTF9cqIvapDfYcuIc2A7kih
	 sWlm3f0Xg74pw==
Date: Mon, 23 Nov 2026 15:31:54 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 2/3] KVM: Warn userspace against ioctls while an exit
 is pending
Message-ID: <awRcDlU6vFaL3uKt@gremlin>
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
 <20261123113435.1170711-3-fuad.tabba@linux.dev>
 <awRKhCne0gG1gKZN@gremlin>
 <CA+EHjTyM4_P5v0cHEiarq5XAb2A0Esshb762BLuuKnyBvH=y+w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+EHjTyM4_P5v0cHEiarq5XAb2A0Esshb762BLuuKnyBvH=y+w@mail.gmail.com>
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 03:23:58PM +0000, Fuad Tabba wrote:
> On Mon, 23 Nov 2026 at 15:09, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> [...]
> > Very much agree with Sean's take here that we should instil sufficient fear in
> > users at doing silly things (also in general not only KVM :).
> >
> > I wonder if we could add some specific examples or broad description of why it's
> > unwise for better effect, though? Comments below.
> >
> > In general though:
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Thanks!
>
> > > ---
> > >  Documentation/virt/kvm/api.rst | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > index 89eb6be9bc6e3..980ef0cdc1c91 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -6974,10 +6974,13 @@ to the byte array.
> > >
> > >        The pending state of the operation is not preserved in state which is
> > >        visible to userspace, thus userspace should ensure that the operation is
> > > -      completed before performing a live migration.  Userspace can re-enter the
> > > -      guest with an unmasked signal pending or with the immediate_exit field set
> > > -      to complete pending operations without allowing any further instructions
> > > -      to be executed.
> > > +      completed before performing a live migration.  In general, userspace should
> > > +      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
> > > +      completing the original operation.
> >
> > Perhaps worth saying why? E.g. (as I understand it) that for these exits the
> > operation is only completed on the next KVM_RUN, and that KVM relies on state
> > left over from the exit (including parts of struct kvm_run such as exit_reason)
> > to do so, so any ioctl invoked in between might clobber that state?
> >
> > I see you intentionally avoided documenting the pre-fault case on its own, but
> > with the above stated I think a concrete example might be example here, like
> > e.g.:
> >
> > "For example, if you were to ... that would result in ... which would absolutely
> > ruin your day because ..."
> >
> > Kinda thing :)
>
> :)
>
> I'm not sure it would help, tbh. I think a reason or an example would
> have the effect Sean wanted to avoid [1], where a reader takes an
> ioctl that doesn't match it to be safe.

Ah fair enough, I missed the bit about purposeful fear-inducing vagueness :)

I guess the retort to my suggestion is that a user may think 'oh well I'm not
doing that so it's fine'.

Fine line to tread I guess!

>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/av5CBjbeidUUWiLq@seanjc-mac.roam.internal/
>

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
