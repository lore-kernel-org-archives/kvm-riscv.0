Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B6606A31E
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWcHzW5H;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YNNY+6HD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QFWtXi9dbe498qumyR5P7gUek+9Wwgd+eODGwKeaIvc=; b=xWcHzW5HiLAd6b+uVxT1m7k7RD
	jxRK83h47lFM+pEwnVrypPBslaOApf1n4kqPhMC/5wEBVi8VqxAtDE+Xdwf6ycuxoq8txLQ5pnMGN
	c2QquKJDACnxJRZyMasamio4C3qTSKAfBhDLPXibZE27iIHR2AYadOGmT5HR8+rlHqW8l7+qW4NIN
	ka3NSmsH4PmjgF5wk3tcH1tdgkykTb2lNbWTAzN7ojXdVWNQ4Ili/iQohzyGnLXy7PNQYg/Xefxfv
	GSgCtFyqvEWQ3ef4+mkOFOU6iT1++Lrao3rW477a0PNm4aUZGeh25jyLcyLzvrwZNHOiJSAa8PyIF
	FrmGJLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVuL-00000003xr7-3y1c;
	Mon, 23 Nov 2026 15:24:41 +0000
Received: from out-45.mta1.migadu.com ([2001:41d0:203:375::2d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVuI-00000003xqa-4C3p
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 15:24:40 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gnvbL4VdHXSgoWEMo9YirAKMsnzbccETpFKUkQOB1eY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447477; v=1; x=1796052277;
 b=YNNY+6HDN8A/oIucaZkxPKlhAxoHLYqaQK9ndlIhZvkqUJcHYVmZmmzWcUZcX9IgKPtkktRc
 NoZ+cS+qPyapENo40L6wMAmC3/ZpUy/4Z/mKGT/q34La7zGrdiDQb5HPtW1V6tDu7ju2DVubfFy
 xWV1L7ABUe6OYxPiai3QvjIU=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f661298bd1ffef35;
	Mon, 23 Nov 2026 15:24:36 +0000
X-Mizu-Trace-ID: f661298bd1ffef35
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12489e87.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 07:24:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQn17Xbb0vgTtyqwVi4KubnLgM1etfLcxnlDYHVOttsja5nG1YJrv4QDHxBtW4to371ZrhKNfvi4A=@lists.infradead.org
X-Gm-Message-State: APuU4Z+ulcYq9L79f9IdHP0c+tqilnRPIgGxOWV/9D+L95pgoOb2E/YY
	8+hgecZZp9Ql7V5bJ5n5qCAwjgB/74LVAi/bWh7sJIFgMxIQ9BbuKjT4RDVTWyKrkAwW4QfgP4S
	/k+exWftoGPaRr4klKsnjK2BqDoQCceK8zWsHFsz2
X-Received: by 2002:a05:6512:1591:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c21a249d31mr226456e87.8.1795447474671; Mon, 23 Nov 2026
 07:24:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
 <20261123113435.1170711-3-fuad.tabba@linux.dev> <awRKhCne0gG1gKZN@gremlin>
In-Reply-To: <awRKhCne0gG1gKZN@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 15:23:58 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyM4_P5v0cHEiarq5XAb2A0Esshb762BLuuKnyBvH=y+w@mail.gmail.com>
X-Gm-Features: Aa3M54ohqjfMpFnSPURFY6Wicp7yckb5JMX6NA8ywvncNdbk8_vZnEW0TzRhLu0
Message-ID: <CA+EHjTyM4_P5v0cHEiarq5XAb2A0Esshb762BLuuKnyBvH=y+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] KVM: Warn userspace against ioctls while an exit
 is pending
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072439_480614_4CC61795 
X-CRM114-Status: GOOD (  22.15  )
X-Spam-Score: -2.1 (--)
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

On Mon, 23 Nov 2026 at 15:09, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
[...]
> Very much agree with Sean's take here that we should instil sufficient fear in
> users at doing silly things (also in general not only KVM :).
>
> I wonder if we could add some specific examples or broad description of why it's
> unwise for better effect, though? Comments below.
>
> In general though:
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

> > ---
> >  Documentation/virt/kvm/api.rst | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 89eb6be9bc6e3..980ef0cdc1c91 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6974,10 +6974,13 @@ to the byte array.
> >
> >        The pending state of the operation is not preserved in state which is
> >        visible to userspace, thus userspace should ensure that the operation is
> > -      completed before performing a live migration.  Userspace can re-enter the
> > -      guest with an unmasked signal pending or with the immediate_exit field set
> > -      to complete pending operations without allowing any further instructions
> > -      to be executed.
> > +      completed before performing a live migration.  In general, userspace should
> > +      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
> > +      completing the original operation.
>
> Perhaps worth saying why? E.g. (as I understand it) that for these exits the
> operation is only completed on the next KVM_RUN, and that KVM relies on state
> left over from the exit (including parts of struct kvm_run such as exit_reason)
> to do so, so any ioctl invoked in between might clobber that state?
>
> I see you intentionally avoided documenting the pre-fault case on its own, but
> with the above stated I think a concrete example might be example here, like
> e.g.:
>
> "For example, if you were to ... that would result in ... which would absolutely
> ruin your day because ..."
>
> Kinda thing :)

:)

I'm not sure it would help, tbh. I think a reason or an example would
have the effect Sean wanted to avoid [1], where a reader takes an
ioctl that doesn't match it to be safe.

Cheers,
/fuad

[1] https://lore.kernel.org/all/av5CBjbeidUUWiLq@seanjc-mac.roam.internal/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
