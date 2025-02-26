Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10339C021B8
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qav8UFp+WJ45OHTVd2iv37+lcdkzReyo3Q0BE4V8hSA=; b=oC0WDRRbTvXeLP
	8NaWHAoVo8qsQ+73Tf7N3DDugaF2A4aKI5DIQk0q9XdfvDvtbj3WQpUSiYvdSPxxwbm3DIilO9XvD
	skN7DfatsPFHdpdc5NWG/vKY/654zc/finGzR1om3/X7k4qYJmrW8LSDCN5JF/JusQAZ54Gyi0BiQ
	aR+w3ATHGeIhd4mSi7+GJY+y0ARfI0yV+f2rDHssiORoZDd3crOrn2y9xEsQKNq0tct/qiRR2hsr6
	DVTFErb+hBdPqUGA2p69x+v/g60H3mAobP9RXXjoHFXpkc3BaOOVV4/Wp+fSJtKnJmNnapwOEhPcP
	yGOTMsQv1lJLLhjo/juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1A-00000005LCc-3AZ0;
	Wed, 26 Feb 2025 20:28:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxv-00000005KPx-2Xdr
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2232aead377so3753155ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601510; x=1741206310; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJfRhZEo2RIsfouA3ZbiUgm3ilY6Xa6tZ9F+JSMVv7o=;
        b=X985XFKS44DqwCP6Dnwo2WEBCMPSKyTQI9Lpy/brUF7+jvCHcljP1LhFypjZ1XCYhn
         KYF0Re9LcSE23qvF8vY9MAxNC0fnMjlGPJ65uJONSzuOsnXCCKdiZ4oSrJWrFmQm5WC5
         VSSXqKNM01crl6DGhd+Kzb+ZLu2bs0tx/9jtRjny+oKbmj52/ldQCQVJzfxeG3m68yib
         i7uBhEVPXqf4fUZ7fT0MJswi4ZqN9fiOKhI9Y4HhdYZD0BsEeCOzH9UKEes8bBVLg4FU
         BfQ6vS9D0UPISjtMd79AgPQbrKccvUPUWIzu2k/3nm8MwmDDcz1sgOMPxqNj6eh550t7
         fSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601510; x=1741206310;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJfRhZEo2RIsfouA3ZbiUgm3ilY6Xa6tZ9F+JSMVv7o=;
        b=OXSHZoqMK8oOUmYxLleIbIQNDJCOdssWH4MH8cSpjMn0sH51gE0/4wnqxQ7LCc/Uj4
         jtD0O328PB2fCvX6mHssIoYGwvik0ufoZzPzLAKNMAyCpmaLRlkg2KscytdFpYSMJEXR
         RU+n8RO9zEDzaCHoyugRut/yEJHw6z+yMpFY4iC3jDbKplfaN4dxUbTHcJnx+3jNsB1G
         BJHDjyWTWVneUJvSq/tUF8nO2LH23mGy6CdUG9qSSWlag25iCNQ8feBKeUWPVLcnXp2P
         HVievN4MG4CGQEua4Wpl84qR4bjB/dIWJa8vGjkCZExOMANeFp6VBNAvoUC+TemICIuN
         Y3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXk7IMCVki9KWpOpyrbFtcyJs+2Z76Bh1d0dFzD9g2FEfd2FzdLwWQtp4twpH3EXt2yABRJvz/tm+c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yylr5y9ZBYysgtAE/Cg1n1TP7FLz7gzxA7W5P2TbnLG8CUYEmOi
	kb41TFWejN0bIYuwflXJf4TLCGF0bPZBz7tZWryIu26lEvQCdA1JjZ59ilHgXxA=
X-Gm-Gg: ASbGncvi4jGMs9Pu2ggxNxuSOzBFcqk58N0/yMy7HGLnr1uydJ+3B+ehlJDxZyJUg3f
	NFbMPTYHUZexKjKXdnSmbnPqDgwtoX87JBAcSRAZ3RfaSzvxRwwmYZ81/bF1SiiQz2lDYq6qdVJ
	75MN4He8Cqux/HcHfRAmFVV++oqtfnB5APUYf+ma8balNYFShGC7qm6jR8eoE/rIOMmPKVh6HIW
	/7j8bjQFJmvGZjC5Mdwx9a4pO5v7CO6Ojc7e8LdUgViVWxKucHnk7c74zqvB7e33x5RT6Ku2EFp
	0rAXhy04asYDzFQchFf9POwhnpN350pUyKXzl/U=
X-Google-Smtp-Source: AGHT+IGBMBO+u+81QuNJ5bB+1erdTCTpC0irRH+rlBfJ+nJ9B7BPIr1HT+61UNH4TSBhiFyqAE9NUw==
X-Received: by 2002:a17:902:ccc1:b0:223:2aab:4626 with SMTP id d9443c01a7336-2232aab496bmr63446705ad.11.1740601510471;
        Wed, 26 Feb 2025 12:25:10 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/4] RISC-V KVM PMU fix and selftest improvement
Date: Wed, 26 Feb 2025 12:25:02 -0800
Message-Id: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ54v2cC/x3MQQqAIBBA0avErBNsSoiuEhGVYw2hiZIE4d2Tl
 m/x/wuRAlOEoXohUOLIlyto6gq2Y3E7CdbFgBKVRFTiTHb29p7Z+nAlEsYYLdt+xU52UCofyPD
 zH8cp5w8fth87YQAAAA==
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122511_914797_F23182AC 
X-CRM114-Status: UNSURE (   8.41  )
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

This series adds a fix for KVM PMU code and improves the pmu selftest
by allowing generating precise number of interrupts. It also provided
another additional option to the overflow test that allows user to
generate custom number of LCOFI interrupts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (4):
      RISC-V: KVM: Disable the kernel perf counter during configure
      KVM: riscv: selftests: Do not start the counter in the overflow handler
      KVM: riscv: selftests: Change command line option
      KVM: riscv: selftests: Allow number of interrupts to be configurable

 arch/riscv/kvm/vcpu_pmu.c                        |  1 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 81 ++++++++++++++++--------
 2 files changed, 57 insertions(+), 25 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250225-kvm_pmu_improve-fffd038b2404
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
