Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83B4C2A062
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nNbTJyLiJv+PfoGkyxFP6DtvS4lKQP6E62LYPJ4tdcU=; b=RKQMR+xZthr0f4
	8MPOHI7YIflb26heu+9eYhCqracsFmWNfSPXjAK5K5Js+nZ1qCMYSnTfRzReroMKnfjQVMz0STVdA
	/Dj8U/QzRUE5DEbEdIwJ70YsNJvcYxgMJKLkuoq9Bq48qpy41XbbUYgYMrp5KCx9WeNhd9/Xeyonc
	sPDlm2+K7eXfsDqTrDI5VTYmdTVcGAlIMup8fIS08r4NMB3cIdyIBTkPQPtkQ6tG06sL/9XvVvH6d
	YTkpX+kKeIyRvt+PD78d9Ss3QMC1nz3sr+q6K2hLc5ZO7AwYEg4k9DNQIoQPhsqYz5tOgRxRTM6Xt
	qCiSPfCl6+d+pp6z7mUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeT-0000000AH59-0nsp;
	Sun, 04 Jan 2026 14:00:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeP-0000000AH3w-3Nwx
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0bae9aca3so188953015ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535208; x=1768140008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEqhNW5O+8RAp0S31dtdTiF5gzWANx1aqh14jIZncZA=;
        b=mDvZw+W91ezUlORSgUlqxF0U7yn7bnxFpSsy5Iwqdy9aGW1UqIeCTLr2mkhGzSh4ex
         kkdVP8O5r1JRGMNC6XamEPh7unNczB+46ULIT1bFLfr9GLj1azNsRVwCvuGqitE/as9q
         jxiQiZOmD6OCn8t11KJsTxqRCAA5LN99ik+dmUTeS0iZT7mOqUY41hwjcnPkbYx2Swfd
         14LvpgogSJa2W/W4wcdYKog/rgUMDSR2++X5KCOHu6SH6TQzIKzote7DXGXePwxtkYSn
         +79RMFEF5vG+xK6+xCWjhKge0Rq53UxmDE/FG2A5yrGRW5PzPA4ctO1FiN/+4TgeZcJI
         Hlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535208; x=1768140008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEqhNW5O+8RAp0S31dtdTiF5gzWANx1aqh14jIZncZA=;
        b=mMJr4+tLoVGVMPHRc37CrpDvWuI8QUD5pu66GiKzt5/647El6WZj/Zh5gbq4hqlFDZ
         crRxrN3nJZqDhCYMPghPAKh/bIqUtbTqk73LJADdLt7vpV8Zz41hk2ZphzYZuTGCIDAA
         dJnV42RvROMZLZ3UmsAcT07cd1aIsr0ACrfhZJsSRLKrExov/UJTcvTYRY5KO5rpU+BY
         uAc0lpB3UwHqTzW9XojdUdUSCU9nWs6XVnitL/Wpj5k5rM4TME6sI6KlkMin971eFbfE
         jNU/93eJKAq6YylIlH3bODpSwnLsRV7+K+7grmkx0yXtWkG2ZXpiNN+FAVkrNCmbgsxs
         d2yw==
X-Forwarded-Encrypted: i=1; AJvYcCVMU7fp9SOrHFtSOnqLOtcJNVOOIRchCHNGcDeI9AIG2l8IoE/Vr1ICHCRE18aoKHnWCJa3Std6wX0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx22T0iKRIi+2v2quny5nWUTr2SURdV0XnY9ZN9/Cu1fBh40IT1
	i6VB+ZTrfi1tfIEDeT0GpV76LANT1bVk3nBfnHizOsgK4YwhJUh3xhul
X-Gm-Gg: AY/fxX7NufeXx5PcGmVhRrojOsWUcUgHoUmyT0aUJq3zCVPxR3jnmGQ+bq8ZW0t6r2u
	bRGZG5DE/cK8+9MzlLJH14ho+2f5MHaA6N3RFZ8xukAItNBTybmGXPGvC0AYBxpO/FtOuIXvU+D
	DQpofnzIzDLJ5oiMsgIVCDegRmXAbzirBH5K92muu7PO1UPuZrw5M4OO0wRrw96dfBJdMIBHKRT
	l35yIBW+q/5rHeYAmX48mja5R9TmM9dh0njhle0tnzfH0OUncD4qcGJAN4XXqAjJa48IBHy2/yW
	zm8N/Ix2jbwMF0MWwNBqwbVVHC/mt8HqqQryEwFotGoFGzM3GdTwQW5R2jpejU5YCMu0h6lUste
	0xWTGKsr8OjHk7xUP9HMeCwvyuO0fPqn3hYuyfdEAKjcQP3hZCaKR6chtcSV+QDqzeFR8jB9583
	OINsG1nijdmKLHCJj9zoHbaEKqu1A2IkIlACGrUSaEKIHXX2GBuEfZGZr43tcxRpxm
X-Google-Smtp-Source: AGHT+IHYOHBJT78zqotwaAPeOBEa33pI9OjGBIGmbHuEBwmEYLu2IfXRLZs8IapRix35ur7Qubzuzw==
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr476919905ad.18.1767535208281;
        Sun, 04 Jan 2026 06:00:08 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:07 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v3 0/3] riscv: fix timer update hazards on RV32
Date: Sun,  4 Jan 2026 22:59:35 +0900
Message-Id: <20260104135938.524-1-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060009_856119_4DCC6E3B 
X-CRM114-Status: UNSURE (   8.66  )
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

This patch series fixes timer register update hazards on RV32 for
clocksource, KVM, and suspend/resume paths by adopting the 3-step
update sequence recommended by the RISC-V Privileged Specification.

Changes in v3:
- Dropped redundant subject line from commit descriptions.
- Added Fixes tags for all patches.
- Moved Signed-off-by tags to the end of commit messages.

Changes in v2:
- Added detailed architectural background to commit messages.
- Added KVM and suspend/resume cases.

Naohiko Shimizu (3):
  riscv: clocksource: Fix stimecmp update hazard on RV32
  riscv: kvm: Fix vstimecmp update hazard on RV32
  riscv: suspend: Fix stimecmp update hazard on RV32

 arch/riscv/kernel/suspend.c       | 3 ++-
 arch/riscv/kvm/vcpu_timer.c       | 6 ++++--
 drivers/clocksource/timer-riscv.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
