Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE5C83F10
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xm4u4He7pRgLUgMEaFmQ97km4kis9aN5v6lNwWfvr4c=; b=LAHQ7IsxR+26jXoR+6GeEQIgcN
	Gh4cfOu50GAosrwE5E59wxv8QV9ZLuHxyMawEc/XAb7yAUuiFdB3acu3WXPsQ1PNTszmAyuOnC3To
	NwlOAtKElIAZJVX0MfH+acD+zmhMzxdIqaIB3Qsixs3sYdujBOjRJqmLPFDe3sGqlEYIcXiCxypGD
	IAByaMPjKZ80SUplDRnD+JCYEzUd/XhaRQjAyIjNoTgSm3pck+U9EUpuUHVW5auwtIb+9VX9dC1PM
	Y3VQn2w1owY+QhIKc8iQvKI2E3eR+25tX1XZXAioiRXOYitOF0RvxxYPdogMYuNUPaYyY5i96a+vg
	h6PFjLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf4X-0000000AJuH-1TNh;
	Thu, 10 Jul 2025 00:23:33 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf1Y-0000000AJI3-3csX
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 00:20:29 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so696361a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 17:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752106827; x=1752711627; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc+RqRq+W6sCtPNEa/tVWodO3UqzUt3YwAEia9IzCeQ=;
        b=vVy6Yfj+IUqfgT5Yr5BUoHLiOT6BJcT9GLHfaxgurHUYNMHvWLr8EZSKNhQ9HRcW9D
         9M4qunJzsm3n4/NvjGvnKCCbuzYYXyo01J0GSUDF0TtI9uO0NrpCixN7t+qLtRtcH+sb
         GfqFIp7/inTkY5fC5J0i8zq3d/rOg6Q8LHNlCKhIMgxktpF94dGBAtE/GVMhWVLmC/0C
         55np6aLVlFH1z9DtjGN63XXPNsxa7SyY/4qJtUr2n5HdeRdRexa9zWqGlXe8oihJApbU
         vJc9P2bHIUvcnX8EKO5w/1ykuBQkihLM2jdQLotmE8HC5lFR3ObWHQrSF/x1GSkHk2ju
         a0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752106827; x=1752711627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc+RqRq+W6sCtPNEa/tVWodO3UqzUt3YwAEia9IzCeQ=;
        b=lCYoT1g5nupKJADL6jaB2oFepbWQn2ZMhfcKimSyCungGPO5wWfH38jOKN03U/kQb6
         jXPd5pocsXQdx79X/n500Ras2Z5uldom+f1W1gVLboTleGuJPjRvuUMGRePVuvb32p+m
         4/s2VrSch2k5K+3owFry4aHy8qwskNM1iwqIHUuKfGa/ml+g7CcSVLZk+7bkwOYqzVs5
         pB5wRpCE3t0vzpYnQnTrxq2O/HV8RZMvdb+mOWLs9k+Nep7S0P9JNKzfuE2dDc1esI5z
         CmhdZgNvDrciZZHv0Fm6XYPIJZmXYqI15JSYhZZkos0T3UDoUwCYAusP6N9m2vZyvCHv
         DEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnmCOyeBufX2XHGZUPzRHKfWx3O8hzjRbCdAy+Yp1xbaDmBx1PcmYWTkNkCi6uhXZIRHu8aEeHMEw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoFJ5ncU1t2iKOUO2EL6SUC83TYyUvcsptvCW+62R42n45JvTW
	TozQorHtU98yL6ZhNxap1O/cW41N6JVOe8S8cxI6T+yHD+Xl1/6vYxKeMv3KsyF2iFVN6T1ZECQ
	hndrNcw==
X-Google-Smtp-Source: AGHT+IG0GxjloovxJcYgMFXWq5yLXp3npn9Ujx5nQOTSIQhv0jOvc/gWF8I+wEWsfveSljef5y7J1NorZPc=
X-Received: from pjtu13.prod.google.com ([2002:a17:90a:c88d:b0:313:2d44:397b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28cb:b0:312:eaea:afa1
 with SMTP id 98e67ed59e1d1-31c3f05249dmr924623a91.29.1752106827053; Wed, 09
 Jul 2025 17:20:27 -0700 (PDT)
Date: Wed, 9 Jul 2025 17:20:25 -0700
In-Reply-To: <20250606235619.1841595-2-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-2-vipinsh@google.com>
Message-ID: <aG8HSc_yj6O69Uu1@google.com>
Subject: Re: [PATCH v2 01/15] KVM: selftest: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172028_895655_E1383C72 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> +    parser.add_argument("--test-files",
> +                        nargs="*",
> +                        default=[],
> +                        help="Test files to run. Provide the space separated test file paths")
> +
> +    parser.add_argument("--test-dirs",
> +                        nargs="*",
> +                        default=[],
> +                        help="Run tests in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")

Almost forgot.  My vote would be to make these easier to reference, e.g.

 -t/--testcases
 -d/--dirs

or if folks like the --test-{files,dirs} names, just add the single char shorthand?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
