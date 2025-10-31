Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D45CCCFA02
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 19:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UiUaGJS+wFdaKc1Oxq9D5mMYgC890oB45ulrL3gJ3Kk=; b=fZ272G4lGxkwis
	8fcgR1YZZpjpyWoa89tYQa6L7PqVn9ze08v87PU0Jx2cm/+HQpPz90B5ltLTrpxfEk4cC64ytVD+t
	AU7eI+aUKbOUg0hB60PW8DHIGCnZSwwrsM/bvDdGrYY3ZVKP/UTUbZ3wjAO/0c3/piUjfinxHP1UX
	OccTdiO051dd7V1Qe9YfxYaT66dEUx8rH+Sx2AsNrpNdztXNK7nl4xOaketTGMWx7MkBCpAnT8dDe
	cFEEcC0HfcOrQ2jCaOTF5lc7Y8XuI3VIf29zIV1sVCQ3mUhWMOg7CuMy/8cStmRk6d/WtRL1c4Yc9
	y4kiHOrIlYhHQe5i6y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEulQ-00000006hdt-1S2k;
	Fri, 31 Oct 2025 19:26:20 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEulN-00000006hd1-3cV7
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 19:26:18 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-945a6c8721aso105379739f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 31 Oct 2025 12:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761938777; x=1762543577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=icf6Tc3LFApZn0/a1ZOba7hE/ekQREoZIBEN7edC3OE=;
        b=LanJ8EXXib4SX69/moM0PqvIYT8yZfeB7F191l8Vg9A8GrSYqI1+A7/scwLpFVYIog
         C1c87VsEheq6S3j6W+scSCsklZ4b8w8DUhIIqElzJjGAGAEiO+LG/61a7RYjM+CHFAS1
         EGE7Yv1KjR/sWl/nFaH7UOLdTkOH7x1PcJmXEwanuF4KptqmauAOXVJVXSc+NW1ifZMu
         ZVztLr2QHdqcY1ryohhs+wmpb1KWBJgMl7E6a7GgRocmVOD9wshy3A6tUWXZczku3PVn
         FlR/bvVjl7Zac2iTyRY2S0mFHQBfXlPGneRSZT/8d+VVQMI6SaLzGGHaCD60cVi0F8dM
         sTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761938777; x=1762543577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icf6Tc3LFApZn0/a1ZOba7hE/ekQREoZIBEN7edC3OE=;
        b=Fpy9hb+oYvIqtHMZJoYqxyCOAVyPeRNfCrGRGRQMe61SsgIlzeEa8TjhOntX24ulTg
         UDZUKVVKLguZrsIcdfCWqy+QrbJCAcl21bh762UM2YKI1RRBJF/gCgcdNoJxLN+Qzs7t
         wTS4QkT3yfnld/OAUPWzd6yg2AKZPPkejbpQOtuDKiT07huJdhPOXspBUpaFTuM75fTE
         lu238IcIX5Kim4T9NLRtMpeKcnI5LWFWHf6hQ0bf+VQ7vlPYX2Fcdlu+1flzV9jpJqgd
         1b9/dR6OAcPSyd1saB9tJXuQsUz57OVxvB8DT+gF0oHsWRt1zVVKgzzHMOCrRMOZArp+
         i8xg==
X-Gm-Message-State: AOJu0YzibjsL5IIucCrC+ccPkphXBnwff6sdJHGW0TPVuMyGYi/XYxZI
	pVtbDwZxL9JR3xrcHwe8l1xhNR4ych7FGEWqq682kXR/SkVb99bMwIJUM9+r+00Hb7JyekXNz1O
	HpfxcmTrMnw==
X-Gm-Gg: ASbGncvaRDAJr/q/Sl/JJr0wY+iUMvOYJEm7xtJdJMi1DSMQrAR3Qyiha3QhwDATsLX
	PNHYawJyFOLdV6jVRCYTD7ZfcSc4H1I9BFnC49HKF8XXxTMgfIFD1lvJFXGXwkOpRbrzI1IAApC
	IiM7wX9T0gxNtyQmxDqq5NxtqiEvoiO4XQgFAA2H/pF9KWHjoYLOR6cmprwFvBlRFjc/RB2Eu0S
	fxTF4Ddkdm7WtD6sqTGkN9HFF4WF852NhfBEoOp1iVnSF22/aluom0zktAyLTwv4BW7YqutJ1yl
	GjDx1p4DGXybYnX3Vvc7wexShdPn09DwyKHcF0prSnQqgfJf2iMomVS/gdU82qseqbnWT+N6CPD
	IzN8vabhqBjvGYB1s/hCqWhGqCoRT3DwhWZhH4rgL+2+UlQ5TtqOJ7dbqW3+MX8edJ2ZY2JnWob
	KgPQ==
X-Google-Smtp-Source: AGHT+IHS2wF07uzvlljBBeHHePgIeT/XcWiDSY6ZQPLbAHUR+KkW7/U1QOfDMnrp2VQzzRQgb+Ii5A==
X-Received: by 2002:a05:6602:6d0d:b0:945:a948:759 with SMTP id ca18e2360f4ac-9482295fbf5mr764435539f.12.1761938776820;
        Fri, 31 Oct 2025 12:26:16 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b6a55b19bdsm1014139173.38.2025.10.31.12.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 12:26:16 -0700 (PDT)
Date: Fri, 31 Oct 2025 14:26:15 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org, rkrcmar@ventanamicro.com
Subject: Re: [PATCH v2] KVM: riscv: selftests: Add riscv vm =?utf-8?Q?satp?=
 =?utf-8?Q?_modes=C2=A0?=
Message-ID: <20251031-9175be2817ae0d519749998a@orel>
References: <202510291139.59TBdMIU031588@mse-fl2.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202510291139.59TBdMIU031588@mse-fl2.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_122617_901294_F23E0983 
X-CRM114-Status: UNSURE (   9.91  )
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

On Wed, Oct 29, 2025 at 07:20:08PM +0800, wu.fei9@sanechips.com.cn wrote:
> Current vm modes cannot represent riscv guest modes precisely, here add
> all 9 combinations of P(56,40,41) x V(57,48,39). Also the default vm
> mode is detected on runtime instead of hardcoded one, which might not be
> supported on specific machine.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  | 17 ++++-
>  .../selftests/kvm/include/riscv/processor.h   |  2 +
>  tools/testing/selftests/kvm/lib/guest_modes.c | 41 +++++++++---
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 33 ++++++++++
>  .../selftests/kvm/lib/riscv/processor.c       | 63 +++++++++++++++++--
>  5 files changed, 142 insertions(+), 14 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
