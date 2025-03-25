Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7393FC3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bzeL74/2HAoNcntcois56nBAFOzUSDblZWlbkILQ5ws=; b=sdQw7bdOc4wJxo
	/LHhOzUFa04kemY+bvowyuA0gUjJqv93wpA0NWHE6mOkiB3L3fADojN2BRmKe738tcH++4ecLX79B
	o3qTHdN91ByrBEb3mr1c8CtWtAEUlkWRptfEtmNspRFfYl42VcrZzveGZV+I6H2A5vjjzpwQdJmlE
	5/tFUaLvwNB5AZoC/k4tcSH6G2kLXac/WRrBj/OEUNOfYqXMvRGgQJ1lVTJa76im/SzpJltgwMuKn
	P7QD7EdouzMiHxjzkaLkJ74MQ6trzDveyLvotxUyK/QZOEifOmMp9Gw/peM/HdZcLkHwyt22V3lWr
	g7oEl5wHb6+LIqNEm/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yu-00000006SV6-0GKj;
	Tue, 25 Mar 2025 16:18:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6oh-00000006QuI-46gi
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:07:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-399749152b4so1671531f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742918870; x=1743523670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQTSPvF1hw0TOBoPMd31WqVvKG9w/U98Z3g9Yg4clUE=;
        b=Q8Cm6OToih8TLIGHNdj2tnVZ0DU5YTypN1INsZIB9Sx5SlaWvG9naDY+2GkEHyydJ2
         bQnq17bDeL6ovjwEGdBhTRo1kjm4xaF/89oCkIi5hrFQ3swPdmCOnXEXdcXB+7R4+VxX
         S0239OcXvkiTH/bsnc/Ae6ksrpCho/RLg99GxWENQapG2PviCavRb+SVIhXAFnHtXOBY
         EbdzBYeY6LvwhRX+Sw0kep//t2K1CalDghfoPd7eLWLdO0cqW2kNjkSoHsfnpUcD3Zqr
         jYuWTmm2gvqVZ8fNEJrPbaQ1OrE/JeBF9IQDXmZVM+JBB6K56xpuX0OthZusfEsUuiko
         NUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918870; x=1743523670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQTSPvF1hw0TOBoPMd31WqVvKG9w/U98Z3g9Yg4clUE=;
        b=eeEAVq2IMcvM33LernmnVsIadna/aBMcdin5ApJaBZ/LvVnu6zJSfXWtdqXau6E8nf
         ErPM32m1UL56XHl6RX8sfegO02ShbbzGOmXZvVy0edL50XpvZYearZhTNc2yKzUYnbFr
         +u3H/9FrCiX+WCmMN82NP4vTmeAPNn8eHzJs36PjFbs45Aw72l3IwZLB42XesSqRSTEu
         7h6LGG6+qWSaVkFdBfV6GcCc8veDlRKjQYZMu5Fp0UFAseDCaODybGPEILP4br8Ymz8J
         lKfU9jfsMrqDiywZc9B25iEKefh7WjwqP+9MMH9fioFFRakQaRZ9vxbNHglt5oC68AJt
         +b8A==
X-Forwarded-Encrypted: i=1; AJvYcCVOKnz5cmqspk6gSxKPY9M1HABsI7DsaptT66Mh1KBfTxP35O8n0WVoDCCjlUnJcery3uNG1ZOXyoE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdUS4Iw/6kp6Co3It8zKGWwCfVHPOIEM5OG7eD5t+6HEX+fN4/
	CGU5vxmgN2AEtZbYidH2ucxgmVElvmYr6maOJJGOhppjcsGaLIbD/hYA8flOBtLBGRtJvEWwWGV
	5KrU=
X-Gm-Gg: ASbGncvUcAoDvWMSuFewiePJ6+JblTp91wfD0rEKCl9viTZxQyTN6IkdPwv2gody3I9
	th5tFkwHOdXb6XXknbOJT0Me5qb+SuF97N44J0Ff3SBv5ocIxoki1NtTrPk32UnSnv9Eb9YF7HZ
	dboWuJMIM1hYNISIo/srjnBDrZl2g6DvadeoxFFyduFLZpa2db5Jq/8BrqZK8Bkga0myQr2vSon
	4BRLanNSY7gh0xilP5MZywlxj75E9iDcP/mSOLJWkoKqQ/LHckpLnon5PYU4SX2WBSpvTWKX5B+
	JEQgFjJEvVlQi3WsIxOvN5O5FCUT5dWt9DCU+5xiiwVra3oYbYjMKJyFi9h8a9s=
X-Google-Smtp-Source: AGHT+IHOT5jOCGHfjXZiwn0hAT2YJ2NpVHcZDDE7JLfDT/x7D7gnwHssedDwTGk0WlzARWAy46l2EQ==
X-Received: by 2002:a05:6000:184b:b0:390:d796:b946 with SMTP id ffacd0b85a97d-3997f932d65mr17628426f8f.44.1742918869724;
        Tue, 25 Mar 2025 09:07:49 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm203972195e9.9.2025.03.25.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:07:49 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v3 0/5] arm64: Change the default QEMU CPU type to "max"
Date: Tue, 25 Mar 2025 16:00:28 +0000
Message-ID: <20250325160031.2390504-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_090752_031247_61AFD064 
X-CRM114-Status: UNSURE (   8.31  )
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

This is v3 of the series that cleans up the configure flags and sets the
default CPU type to "max" on arm64, in order to test the latest Arm
features.

Since v2 [1] I moved the CPU selection to ./configure, and improved the
help text. Unfortunately I couldn't keep most of the Review tags since
there were small changes all over.

[1] https://lore.kernel.org/all/20250314154904.3946484-2-jean-philippe@linaro.org/

Alexandru Elisei (3):
  configure: arm64: Don't display 'aarch64' as the default architecture
  configure: arm/arm64: Display the correct default processor
  arm64: Implement the ./configure --processor option

Jean-Philippe Brucker (2):
  configure: Add --qemu-cpu option
  arm64: Use -cpu max as the default for TCG

 scripts/mkstandalone.sh |  3 ++-
 arm/run                 | 15 ++++++-----
 riscv/run               |  8 +++---
 configure               | 55 +++++++++++++++++++++++++++++++++++------
 arm/Makefile.arm        |  1 -
 arm/Makefile.common     |  1 +
 6 files changed, 63 insertions(+), 20 deletions(-)

-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
