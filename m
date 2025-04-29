Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87474C369DC
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdRDbMQph9/+bVm2dybK9dCcJL8ZF6XRmC536KLlc8o=; b=UmtyF88eQstpNo
	LZvp24GhYw7ay0avTWlGgILgCz7t1Vl2vgJHn7vJ4/3gQRBtOoY0MAtX10fbGfGT12TU4fIx5amhl
	pu0OEgtFOfnG6nSw0Iwe1Viw1Vx84CEjqREXMVshECETwEQLJKETztR6CxO7fVIkVRG/BsqetYPSC
	FUJssK9EWz9C960cPBkxRHFdeTsto5JQe18IbqmZNyJFLyUKAk6GL67Fx8cVZXWNQ066OLqihy+/d
	SiLQ9RchideqFApy4W8FBCfCxy3W9GbDNKpTumm0+OJftkmsSpW//vCi3BNJuTrwktdWAGpM2l41n
	/JeAttqkSzI6CXQRKlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h3k-000000095GH-0gT8;
	Tue, 29 Apr 2025 09:15:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h3h-000000095F6-2X45
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 09:15:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf257158fso32594315e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745918120; x=1746522920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7G2fRclvCUdeaZUX86sCG13onMiH2oYs4old4kGD3I4=;
        b=FkPC89QeSmr98sAsvkHbAwG0DxS1QFfADrPsjrKLnIm3cbkLEd9Oc0j5NBHPG5azxD
         BRk9addLiDPUDuYY7sTGYVoX4GnDcEqgbXZrQWc3JmvQnp2mco3TkNtmnNuMVt2J/0MU
         2vB1pYxAUh7VlFmBe9gn2vRAYEKwKTCF1+vXAfiN89jn2yctJmLpOl++/b0Y4IEv/LRw
         4Nfqx+BLgo4UyQbOVczV0CQRtHgtTXZPvH6DlJdK14Ou/iDc9EPvRWNphIFFwoSREzTf
         MpVRjsbp+ZQaehbIfSSqY4k9pva86HHFM/FUbVExfyA9XIdNIHCQy+NBV/X0U7/NnNbB
         gbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918120; x=1746522920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G2fRclvCUdeaZUX86sCG13onMiH2oYs4old4kGD3I4=;
        b=HPxCO//gzZq0S3OoVTg5A4OrMYSRQ4EzK05PWtroqdtOh2JeFEE6p+IcMsKdbDn1f7
         +fgQ5JM4DW82xfcwTg+gLKj7dWCST1UuGzUESmHbDlh7agacDC3DL1Ttb8I5ezkLrAs7
         d8Q9mGkHpePLtdbIsOAIysSReaN9v/RUXBEtO0fY3EIwThJxdDiPzLOW0dtM4HM417pY
         A9YxKdbsiTRvhni9oJQnDeI3687dSplDwGki/7k/Mte9SnKjmjPumlLdzQ564bj++ZMi
         tresK6jvZuptkBYl8d21iShE/O3iKB1zRqCP2UrHQR+tJNpeUFJRr9Deb0+4F24aYOOK
         TIIw==
X-Forwarded-Encrypted: i=1; AJvYcCV/q6YJoIhBY1Rll52FifjLfLIyw9PR9OR3wnlTPOUk3D6fLe3xqrcmcVlqHDENYfnaIdvRpI90lC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS0NddD7uP9Jd/5qmhtr27h5pAk/gL4Yyx/62pfqjwti2RPNXU
	0NwGpU2gCoJhoAzW8Qv5UgrtFQ4wDKnXGqIb9tJf6k1YA1G7QYsz6RAusgbEY+E=
X-Gm-Gg: ASbGnctUfMyMuXYHxX2MfbMUYkAXe32H9+WIHeOoC5yy25F3Axaa/ebrRs9BeF9ORhi
	MYi+cHfjH1tNriQGPg5iCERylDR5cx+rWRUI1nwggTbE+C9KS9Xoyx25I0i0q4SATuVIlKGWlU9
	CRNCcQwolP7JKahUBLGVzW7PmROsEjo2h80PtsAMph1svFCnFiacQ5Yjpv1Vfv8/+HJgsuI03ef
	ytid4FlFux95EAESdmdpCjhVcd60qvGqA6e7ZB6pNZfBFHQlsrekpTf0O8e5IyQKGOHinq2c9HK
	W6udaO4weRMabciuhoaFKp5cJYiD
X-Google-Smtp-Source: AGHT+IF3KzUkgVrnps/4CLwE8PJJvYiIIYMaDaAAjNNNF0zL6UGQaiXvuOFTaEzk8NEzIueNlYV68A==
X-Received: by 2002:a05:600c:c0f:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-440ab848800mr97500615e9.21.1745918119902;
        Tue, 29 Apr 2025 02:15:19 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a531dc6csm148546415e9.24.2025.04.29.02.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:15:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:15:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] KVM: riscv: selftests: Add vector extension tests
Message-ID: <20250429-251342442ffe2d05e6b676e1@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-3-583620219d4f@rivosinc.com>
 <20250425-a2a40c6296018326cdcf7d24@orel>
 <30b2d279-8459-4a72-aad4-29c1ece622b8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30b2d279-8459-4a72-aad4-29c1ece622b8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_021521_646155_F4CEBB0A 
X-CRM114-Status: GOOD (  24.91  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 28, 2025 at 05:32:09PM -0700, Atish Patra wrote:
> 
> On 4/25/25 7:20 AM, Andrew Jones wrote:
> > On Mon, Mar 24, 2025 at 05:40:31PM -0700, Atish Patra wrote:
> > > Add vector related tests with the ISA extension standard template.
> > > However, the vector registers are bit tricky as the register length is
> > > variable based on vlenb value of the system. That's why the macros are
> > > defined with a default and overidden with actual value at runtime.
> > > 
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >   tools/testing/selftests/kvm/riscv/get-reg-list.c | 111 ++++++++++++++++++++++-
> > >   1 file changed, 110 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > index 8515921dfdbf..576ab8eb7368 100644
> > > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > @@ -145,7 +145,9 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > >   {
> > >   	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
> > >   	struct vcpu_reg_sublist *s;
> > > -	uint64_t feature;
> > > +	uint64_t feature = 0;
> > > +	u64 reg, size;
> > > +	unsigned long vlenb_reg;
> > >   	int rc;
> > >   	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> > > @@ -173,6 +175,23 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > >   		switch (s->feature_type) {
> > >   		case VCPU_FEATURE_ISA_EXT:
> > >   			feature = RISCV_ISA_EXT_REG(s->feature);
> > > +			if (s->feature == KVM_RISCV_ISA_EXT_V) {
> > > +				/* Enable V extension so that we can get the vlenb register */
> > > +				__vcpu_set_reg(vcpu, feature, 1);
> > We probably want to bail here if __vcpu_set_reg returns an error.
> > 
> Sure. What do you mean by bail here ?
> Continue to the next reg or just assert if it returns error.

Continue to the next sublist, but now that I think of it, let's keep
this line as it is and either add a

 __TEST_REQUIRE(__vcpu_has_ext(vcpu, feature),
                "%s not available, skipping tests", s->name);
 continue;

after it. Or, add a label to the __TEST_REQUIRE already at the bottom of
the loop and then goto that.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
