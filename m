Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6560FFC617D
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtJkY/kATxMct85/5dFW07TxOSsTF3od2IpshvckJmg=; b=AfWGbDWyd+C9Ps
	BKEh2FAMNH51chHKkcBGVJQMh7xTtN6j7hZv60j0C1XDqZ4uvWlVfs98+z2CYk3x/2KleaSBI0nWw
	lOwtEbPJggEK9Hmb2/P9OXirZ96B1Ubw+NPnIVQkG3aJ36Tb/MVLmJLFy89E6L+fNB9wqMyJDvpem
	IFDkYDpcFvxKMLGd5dl3mU5mPgDBK+YqRWsoJVouapwhx5MhO1yIDCyucNcUg3VZy96fuwrTQ77U0
	NJvIZAi6wQhqNcGlfAEd9WPP3GtRoKGPclLxL2nytnD2AAOPtW6db5KwWDck9BydQBgAfw/hmRYgB
	Aju1QdpRWoQXnPq2evOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDG-00000009ABB-0ZVM;
	Sat, 03 Jan 2026 09:46:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyD9-00000009A7z-2pez
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso156300135ad.3
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433575; x=1768038375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxjRzDH8YfA2CgJ8ukRlCUfNc/bMZBLM3ftExUQvlc8=;
        b=fhMX4oj0E/VcOOGC1r/gaws0ZSolr0RZb+WdQ/0QCjZlVTDXQlSI6GV6bWe2M+pDvP
         4B3hNd0cyyOu9G7x3hRMMQ1nxeMZh3FT30c5CPTR2KChOzwzpsp1h7cShxlYwP2h4Vv5
         RjTAHbvqV3ZiAT6HBHsVdRbhZSipcD8+AkotlmVMjqtPaIjgbOl9xwmThMdWIqll9GsO
         xImYrs1VcX83qPWFuCOi3VOS73uo89iJXBPvfdoaOrF5JUNIH/EQ80IS26gNEHi9itih
         9yv9aRU5dN3Rr7lamPludvgNbfDD6a5Ik55x/1e+Km99N6/nRQdvKGYwrFllp+wD8oIV
         Dqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433575; x=1768038375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxjRzDH8YfA2CgJ8ukRlCUfNc/bMZBLM3ftExUQvlc8=;
        b=UIPavK7ZU+z+toohmoESGI+uqs3dUVytYFD7i9rsECdecoKFQIT1mbrzU2DsFrjI6q
         pdqnQYLW6Y06EOg5jby1NgcsYo/scuatCB1i4QBVTe266p0pqhQeIB1jJ+Cwhk0leA87
         2aLjlcxdd49JdeQrqqVynFUwFSlKXU+HSRNnOQGSRkqP8D18G/dIBeMrVZlm6p/TnO2p
         2usNzIJlTMab2w8CmJlP8xRTQcvYjMLWteUO0t7cQU7dOlWgz5vc8Xm2eoOHMt7KaPul
         bENOkXY+0lxKqT/DBCF+/M0tj9tQcArCgF8ok05eO6xnA2Pt93N8WL4Uvzvw8taj75W9
         4EcA==
X-Forwarded-Encrypted: i=1; AJvYcCWEPwHDW5hagJK6kfTvnA02dL+7L5ND5mt1PKxbVNzRcCUuW2VtQA93TXrr9lv/Kv6FyX3aX6+Eqxc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHCqpBO7MJzeT6WYyexNlA4sUJeL0galBbDiW5Rq676JrjpRHP
	t8R4c7ydmpkIHJefh3tNpGveCMyXSxi9pfE1G9aWUOD7wLUUuc8yTweC
X-Gm-Gg: AY/fxX4K7nSuUctfCfspbI6Ci7C22bN6rxGZfi/kP/K5XVJ0F1begF0pvLD7dJlsxfu
	86hhLqkntKXQW9ucEfnc1R7Cw4woL5HVtL+5REFShSPAAPYVjDbZcCypELj9/2nGYlFvgGHNX9p
	d/cxGjAm3y1P/2wI1KyWFPm6B91xto2aAK+WRECEdCYFLHHzvHejrZNPRcB3HIjjx72LhsNLmKL
	jSzePuGdOKefZ08HRiRwwNH5mntuOd5AWw1hb/LOv/3eb9eQZcJ66dvLExNCa3MPrQOyLkJa4lh
	9b7CQHzAY36y+uCgytA9aGOzTp5VTUWTrhBoaroJavQ+gSJRISDulaConinM2FwiZk5NyLTiBZq
	7thsdudWPrYlVLljxOkR5ROM/vlBwPkCrOccG+DBw5NPxMcm8NUQGHbjiR+wGwz/eT+zDPI5kLg
	zGjltwkH6B44uCr4etZph60PS9IdSYKxgfCAA+NsK6wKzhUzHmIZLRWBhZpQ1aYQt3
X-Google-Smtp-Source: AGHT+IEkB956+B9xGmx9cTGzL/pONpKgSLBP8lNFvd+0O3zkG68Mte459jHa1jjHCkA3n/rN8fRFsg==
X-Received: by 2002:a17:903:290:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a2f273818fmr480811265ad.38.1767433574809;
        Sat, 03 Jan 2026 01:46:14 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:14 -0800 (PST)
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
Subject: [PATCH 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
Date: Sat,  3 Jan 2026 18:45:00 +0900
Message-Id: <20260103094501.5625-3-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014618_879332_6ECF6815 
X-CRM114-Status: UNSURE (   8.07  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 arch/riscv/kvm/vcpu_timer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 85a7262115e1..f36247e4c783 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -72,8 +72,9 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+	ncsr_write(CSR_VSTIMECMP,  ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
+	ncsr_write(CSR_VSTIMECMP, (u32)ncycles);
 #else
 	ncsr_write(CSR_VSTIMECMP, ncycles);
 #endif
@@ -307,8 +308,9 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
+	ncsr_write(CSR_VSTIMECMP, ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
+	ncsr_write(CSR_VSTIMECMP, (u32)(t->next_cycles));
 #else
 	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
