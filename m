Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6CDC83F19
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/LKs/0L0hlpNLUrCM4v6D49+dmw9fxfftcXBxp+6U4Q=; b=SpJEVXyzoL2mnX0miiH58ivGvQ
	Q4Esh8QS5ysABrT2O+7r9ySQQQKJpatntvIdAGqiGjiycg9IsVafksyS/2OzZ/232Q656DwqBH2BL
	cEdFez3RkN1XdUbvJHKPx8GOGBIKcQYb4u9ynxI3obqIKBDY3iZMUT4h2121Sqk8mEkrHsRGUzrkx
	jEXbnwWA9vYJn16f9Q5ec0azV0jIDxSDRDPvnM4dDbmxjtYot+Vdp6Fg6ji4Ob8guKJVZss4yHZpF
	9zV8r0dYPAAN5m8bajx5gZXqUEtxu0u2kTNkpA+wPSXevdcA255rWA0H3v6b7qIrL5SgDj7TTTPJA
	8/eCU9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjG-0000000AAEl-2kFj;
	Wed, 09 Jul 2025 22:57:30 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcVQ-00000009vhY-2M5h
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 21:39:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31215090074so602413a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752097147; x=1752701947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRjFnmCzYN+qn8kF+o9IzfpkXQ4+JquW4HupC73fftA=;
        b=J7Qe2R+9zmMU9OTAePT8F51wCm8asXrtCKd+YX7EQ+tn+JF7hj4KiAmQ8oT81Ks/0R
         2J1Z6wYtiD/AnMZ5ZZCT3UkZO2qSZWrOLbBgBTTy4LW11tx2FStUDVondryQX/BzvFbD
         bcvYvG/h/se2Y5Py+jMLTnVrWlSRTRHeK7uEnZTPhkKGpVX9tjGLlOYkDVMcUh1fCmv+
         gk6T62thmxwPwYNFtwEVVh4ePmgsedSjaRUu9ewCY/LKuh9Bfbzq3IaZmO38Kn/2f0Kp
         IFoDoV2C8hRya0hqpn92kJkW6O8s8XdFfnhv12dUXmQUhzARYR3gHYYGkIUZZ4LxzUAV
         etmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097147; x=1752701947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRjFnmCzYN+qn8kF+o9IzfpkXQ4+JquW4HupC73fftA=;
        b=Ottr9lygYDT6LBmtq3T+zG3o1TlEnGzsvh6FHkhzs3jl2sGsmgcuOic2alLv1zCMc0
         VwOW66kcanfBsw6GsBCV5r/vxcqydi2Km6zSTQyNv/LM1XmSqsIqMaIaOd1jIj7HLReY
         M1eM83f71hi/pLdfkXO7JHZTTpO2OkLVirLFP/FvHT1GO5FxcchQh8yCDjGzxJB3/eBu
         aQMEqYMO0nNNg4ArBxyzBiRQHaOfLHbLafO+ji+In3bqpTJGUIJKso5N+5HVLxN3LhVB
         O1z7o3jNm5HNPSWAhEYf0bsFPm2vxyLXlQIKRaNMM9puERpUNOoeJp+CD9DZm3olm39Z
         yLSg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+jDVt9J5U3Pkui8YaXsY67Jne/j7F0kEYjBL7GTK0/CBhyPNZ0geDKbAuD3oIqWpfFYZkw6qHxg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkH8EWl++vXogkGV9p3opdIO2ZpNT3wDPLcHhxcUQkcSVTHkqy
	4Si5mAH54TsTPx+CFtrgDr+ZeYoZ93zeEktVdWAyoIXtN7tRbuVwKXARVfT3YYUXgDN1WITHsLh
	txd2S4g==
X-Google-Smtp-Source: AGHT+IGqLtd25jQcDPlbBnyHm57aZXVZqGANjf8aQ+PHIDAz5DerrzktIfl+GNc39oHL/0frC4tukw2+CLQ=
X-Received: from pjbqn6.prod.google.com ([2002:a17:90b:3d46:b0:312:2b3:7143])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5344:b0:313:62ee:45a
 with SMTP id 98e67ed59e1d1-31c3ef2308emr245837a91.13.1752097147476; Wed, 09
 Jul 2025 14:39:07 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:39:05 -0700
In-Reply-To: <20250606235619.1841595-3-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-3-vipinsh@google.com>
Message-ID: <aG7heUe_zBf83tlJ@google.com>
Subject: Re: [PATCH v2 02/15] KVM: selftests: Enable selftests runner to find
 executables in different path
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_143908_593282_FDD9B3B4 
X-CRM114-Status: GOOD (  13.53  )
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
> Add command line option, --executable/-e, to specify a directory where
> test binaries are present. If this option is not provided then default
> to the current directory.
> 
> Example:
>   python3 runner --test-dirs test -e ~/build/selftests
> 
> This option enables executing tests from out-of-tree builds.
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/runner/__main__.py    | 8 +++++++-
>  tools/testing/selftests/kvm/runner/selftest.py    | 4 ++--
>  tools/testing/selftests/kvm/runner/test_runner.py | 4 ++--
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> index b2c85606c516..599300831504 100644
> --- a/tools/testing/selftests/kvm/runner/__main__.py
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> @@ -29,6 +29,12 @@ def cli():
>                          default=[],
>                          help="Run tests in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")
>  
> +    parser.add_argument("-e",
> +                        "--executable",

"executable" is kinda odd to me, as that suggests a single, specific executable.
-p/--path seems more aligned with how this concept is typically described in Linux.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
