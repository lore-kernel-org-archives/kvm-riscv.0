Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4EC021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+9lYOQUPeh+aszkhYchSBLC+lpzM8xnIUS4nvM4Z0s=; b=xNTUbKIwH1tkw0
	FIhaCigXXhKyYdtN0GfAeJgW3hnpiMfeEzNBmlO4lewLR3cXH9OTE+JQqasMQ/HoPIJ3E4h2xwxGm
	BLqjYqWsFxqqLNB0N2/EWLCMt3OC2g2fV22X1uFaU7BWfp3idA94VYJxWrzjWIsbd7MuGobKHPDKB
	OqCCG6BHJ6o0qllMRReKevgH7YgmjRjrOPEe4nkQjevJeYRtccWGa/YN8SVDbCwYTDyux6hWPykzz
	fE8zKHVcB5a7TRXDemHkre76SZm3/9bIV5K2nl2glBSpFY2Ftaoyemln5r37WGz4o7A4Uv3V6cWBX
	loGGa/cuanNT8/Q260lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO8s-00000003kMv-1ykE;
	Tue, 04 Mar 2025 09:00:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO8q-00000003kL4-0BnP
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:00:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43bcad638efso4049175e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 04 Mar 2025 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741078842; x=1741683642; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UP7DmGMGEllBfFdaot9026+FUs+6/ByI4Mfm7p9ZUY=;
        b=RVypVYBOVX3zpSzoUsQrPqbq4sJXta2AGOYdjZQCbBPmUcG254wkC+Y6Kt3QlwYQ8j
         Kc61GBCSbIqeOlb1aFBJbXSjHDju7vS0s224CEtNn3R/wSAJIEi1VsF5bFPp7BWaQZ3g
         MSTH+NhyVN0JZ7TtlBnbtsTjS/sp037NUYaQ8opJnYuTQ/kTQ9D/3BAkJqqTArmPlow7
         GDQrB7zFin7v1R4NRJB8kgO7UWUAo91sLHXhYGv1kpOspXdB0ofBGi8ePpv9c/bN1GYr
         qPfA9MnCegYD25UrzXBIKT92behBJD0lG7UPYUmAL9fEEZogaagXu8VHcuvZVXar9YVR
         OaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078842; x=1741683642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UP7DmGMGEllBfFdaot9026+FUs+6/ByI4Mfm7p9ZUY=;
        b=NbI+EWURgEPjmDaaASUGGRnngpawDe/t1VLo2qALVpoZdlivPCes8IdzGIEUsehxGu
         A2mhy/InXQkfjdutYLxRiKq6srWJZqmSeZxd3RsGBm8+4MPsu3LYkBBVRYaj7R8qmBmu
         14uJ0zEmIgpgMdRKdPR2fObnhSvYdZuf30TnyXDQkuGM+5n3YKOkg9bct7hk2srEncJe
         L7MMX6PZWSk7sD/pD0MZ0Jiq7JruBrvffak1yOxaIIgNh1ZIir+3DIKrYwE9gxoBRAcg
         +rA0gCHxmgbP+mGfnC8l0NOyKmeaB8a9rfoVOOpM/+D4pjGQfgoiwkQto2AW+iGP8IhC
         x/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KJaeI8VhdalXvzbTA03YUY/MG88QU52aMnqbgasscgG5PZc6ClF91GkupCOsy/Ui5RvTNcjOKfU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCk9fAQlqiEN8+m9mNNuQCnaIUXZl6ArxrKrw1p2Ktew3gf0cZ
	WWLtw3wZ5gSpFSn7IfDXefz4E1xTP/D49L73PWCQdPmMZBfZsY+JaWN9tqnu8e0=
X-Gm-Gg: ASbGnctG79Mum6tYGi+d+qzPWToR5bgEm6CgFrNVA7PtOyJ4yXwVtjDapzrFpnElyRS
	Vey1c0c1PI1L9HNVrZ2sn3Up62Ontp+o0co5xByIb4XLWoh7Vfr5+LIjmYoP5fWk7ZfiL5FvIDQ
	arABEQ8XxX4i4dX+vf98D2MmDplbwIa28zlThHlXN2jPZ7I2reFjyB8u7XlFrIMmVfaSPRMV7Ud
	/te+1IXQt3IpY90lRXDgXxhpmIt4y2IqWe6tZRGjeAECGT+R5FnyRSPbv4lnCJmHkIcxnFgfGpP
	+3/54wLCLRzztBo6n4AHuX8DUr7xCA1p
X-Google-Smtp-Source: AGHT+IE98Wtw/qck2RNdbUy35iBZdcuCmo9BHlXLPhcqJEgVkq5LxR8GTapjzExbGuStv6PALsyUfQ==
X-Received: by 2002:a05:600c:3b23:b0:439:98b0:f8ce with SMTP id 5b1f17b1804b1-43ba66e60f5mr143195855e9.7.1741078842210;
        Tue, 04 Mar 2025 01:00:42 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbf2edf84sm75715855e9.40.2025.03.04.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 01:00:41 -0800 (PST)
Date: Tue, 4 Mar 2025 10:00:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/4] KVM: riscv: selftests: Allow number of interrupts
 to be configurable
Message-ID: <20250304-bb96798e9a1fd292430df3e8@orel>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
 <20250303-kvm_pmu_improve-v2-4-41d177e45929@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303-kvm_pmu_improve-v2-4-41d177e45929@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_010044_081754_1C9936C6 
X-CRM114-Status: GOOD (  11.78  )
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

On Mon, Mar 03, 2025 at 02:53:09PM -0800, Atish Patra wrote:
> It is helpful to vary the number of the LCOFI interrupts generated
> by the overflow test. Allow additional argument for overflow test
> to accommodate that. It can be easily cross-validated with
> /proc/interrupts output in the host.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 38 +++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 7 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
