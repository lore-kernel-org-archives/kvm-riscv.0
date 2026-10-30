Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D2606A31A
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f+jH189A;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=CM5SjNC/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+WhQpT6dUh+PnsHPprt8kAccuZrA2kowAcsBlgUTeWQ=; b=f+jH189A5fEct2/Fnc2sruQbLj
	Pyof1VEaW5uD6WmElFYDNkYEwqDzv7qf7q4+999ocZ6Syd7o+dPIcKeHKb7Fm8zDI/7DUyg6ddfqE
	1fx+xrfd0Ins6ehSJNHN+K15oLuy1/xtUYgoiLqia0EcCCe16Q/OSglb7F49VcriSutLWOlDigssY
	SmODqMCwYVW7e+0NqRezUPVsAVUt0c/w1xbgiOkpuTeeJInlDDEyLMLC79+9SsQgZ8KLlvEMnu/Wt
	VGvbZ4VkS4JAs4j7kETK+KqL+1JUYhuJypqofKzAq5KPFId/6+ThkI3acrGV5Yr26tVSoNBNLcecQ
	Ep4uMZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrTF-0000000CPk8-3UOa;
	Fri, 30 Oct 2026 18:36:58 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrTC-0000000CPit-0BV4
	for kvm-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 18:36:56 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67a2efec15cso1061069d50.0
        for <kvm-riscv@lists.infradead.org>; Fri, 30 Oct 2026 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793385411; x=1793990211; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
        b=CM5SjNC//RLrfeNV/4hdBMSyN/gyd0aecXZToXYX1lL86OH0jyqNiYfSzm4k/mNg05
         nh7RUlU9gnKUGKBW+BLdupJdDZfxqL3UpgA47537kZXamSnXZJF/x4rW0KSS/mea2z8l
         UWkdwc7mBwEFYQVkmSIsh1FqWs5BVjit7LrdYaZM2fsUoZ+Tc2Rum4ayJre+PXCxfPuZ
         652K88+nKf2mBC6V4p32cZ/hh7VjBqLfoLymCKYsIc/kLyE7+aEzJnmmHRBQ2B+wmRvV
         CN06ds+/ljvG1uPmub57PSHSOEtTajC/155YLkiGMtNKJ6Umpa5z/SQAx0UmqWdQtHNS
         iu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385412; x=1793990212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnreq8dc1kXyWMWD+2wEJ3SBKmyDtG659lWmXyFpFB8=;
        b=uM0hg2D2sduKFgtdKfNkLXmh6snReVxxxtQuwStR6EiWWl0Mrxn6Zgdx6I5mDHoObP
         vExUUTkFrmX4NjwxK3Mtbgy4prrjCdVLTLsVcj0CxzdNkwOXdvm6J7HzvbIPriWHOVUl
         E3KlBUtucnahPEgG5+i68ObgxzYfsikfO59Tgsjr2tW3ILX8g2pRsLx/ZZIZWyWHSwVb
         HdUV3pcuMnkcwI8xlySO+SSWSJLC2nDAlp8ByeDH4N9AAQ2CGlRKtyhnbmdizXM3r2Af
         tPVrCp8sol1apARluW+MX0rp2HHrmh1ktu8spvHHR8xDBcQdq33er/5RAr4cr26XmUWI
         hB8w==
X-Forwarded-Encrypted: i=1; AKwUvBwFWIm1lIJNkYdYL/7IkV3yQy6517ocspoBAwP+O/oDSuZniLZ/bMHxQ1B/Mp4rryUcIn3UhjSY7B8=@lists.infradead.org
X-Gm-Message-State: AFq9FYL0VsvwrjW6RnmYQ51ERgaY3ScsTWvziSVdgUBl+p3E0CdLEmJS
	1rPS3oP6Pwa5jirdXuzj9pKGIOz0PiESovq8iugb/dqB6f6SURPQ6malrvnY3wVkMdw=
X-Gm-Gg: AYBFou3Sp8lxoj69g3DVvYB99biWBfhk6KHlM5H4v4B2vSEPBdLB+u1d6Fg6lO1gKX8
	jrerFMS0pcZaG772NftHk7CawOKLflu4ynEuxxGoedJfcUROSwHPmbabFf1O+QjPVlBYucJqpKp
	EuL5qCmnAkSkP9pm9YhAo9hk2mFcC1gbUL98i7rCgiUjxfun1E38VBNoZRrYvKu90oj50VmZRPw
	4fp1yIooNiq5CmdJIE4Z1Q6Bx0sJ8I0S/p2dLTzcHlyiEV3xWH/K9EpjoCfLwtnqLKq1Q6rkCgz
	2+/SDykSQ+A+JjOzkNxz53yq8zjuemX0kE0jl5LW+P4WbkLUQ34VxpFq080roGWZOx8HBI7dlFJ
	SlYl3X0dD6+JtDryb8PN7h31tyAd5NfL2LLv92XNS8KUVe0cXrCS8u6N+ZIdN9PciA6ayjWZv58
	rQOMYWeqXBwc39Mpbag/HeRXeHNEneUwXghdiNCiOFmkCNjag8Ye3jkyc1NgBUH8SfHtyD7U7Ws
	Y+aEgWzneazOtnlnC1mk6ZIC22r8V9XrsJVdVo8b2D6SgXRcS+fZ2JT61/aNtltlD8DERSiIRNW
	MF8wTB05BF7oow2ztKqQ/SveMgP3EGz3KPs8GfhOHgxeUsaAqsJP5NJmEWEclw==
X-Received: by 2002:a53:b4c3:0:b0:672:c99f:5f5a with SMTP id 956f58d0204a3-67a8d398a79mr3576548d50.8.1793385411605;
        Fri, 30 Oct 2026 11:36:51 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf344b20sm454126d50.20.2026.10.30.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:36:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:36:49 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re:  riscv: Deprecate vector state prctl/sysctl
Message-ID: <auTjwQoRqV5ayKdx@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
 <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_113654_097376_8F6178C7 
X-CRM114-Status: GOOD (  22.73  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Samuel and Radim,

On Tue, Oct 20, 2026 at 06:08:10PM +0000, Radim Krcmar wrote:
> 2026-10-07T01:51:17-07:00, Samuel Holland <samuel.holland@sifive.com>:
> > The ability to prevent userspace from executing vector instructions was
> > provided as a escape hatch for software that was broken by adding vector
> > state to the signal context. This appears to be unused in practice, and
> > creates confusion in the extension support returned by hwprobe(), as in
> > this one special case an extension reported as present by hwprobe() is
> > unusable.
> >
> > Since we believe it is safe to always allow vector usage, hide the prctl
> > and sysctl behind a Kconfig option and mark them as deprecated, so they
> > can be removed in the future. Note that significant userspace software
> > like glibc already considers these controls explicitly unsupported.
> 
> KVM on QEMU breaks because of -EINVAL:
> 
>   static bool kvm_cpu_realize(CPUState *cs, Error **errp)
>   { [...]
>       if (riscv_has_ext(&cpu->env, RVV)) {
>           ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
>           if (ret) {
>               error_setg_errno(errp, errno,
>                                "Error in prctl PR_RISCV_V_SET_CONTROL");
>               return false;
>           }
>       }
> 
> We could have somewhat softer deprecations by defining that the vector
> prctls succeed when user intent matches the current state and deny any
> change.

Thanks for spotting this, after discussing with the team, we would
suggest the following moving forward:

 - The prctl and sysctl interface should remain, and PR_RISCV_V_GET_CONTROL
   always returns the enablement status.
 - Turning on vector with prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON)
   should always success on a platform that supports vector.
 - Turning off vector with prctl, or sysctl interface should return
   -EINVAL, and must not turn off vector at next execv. A pr_warn here
   could be helpful to inform system administrator that this operation
   is deprecated.
 - Selftest should be updated and verify that turning off vector with
   prctl does not take any effect.

I am happy to help on any part of the work if needed, just let me know.

> 
> Or is RISC-V still bold enough to "fix" userspace and hope for the best?
> (High chance of Linus.)
> 
> >
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> 
> Would be nice to also update selftests and vector.rst.
> 
> Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
