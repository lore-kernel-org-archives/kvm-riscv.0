Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0C6106FD7F
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 05:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jrbLPhHh0+ja3BnJ+sf+mZJqxMYd83UicxA9HrpmGWQ=; b=yFLmI5OD4/nnnD
	+tHwxHNZk2jscmBsJk7hCZlE3NKhYIWW5cdslnbarFA5RQ48KKf65+OMin38Rf4eOfWD2Ia386sTw
	h2j0x8RCVx/hUIpMPox+r43xLEGsQCyXTZp9quCey3hrcQn0HBizmRC73t7p8/OO1zb3vOXMEshCh
	7gKlTT0YoGcFNq6UhppD0kfTGivDBK1AwO33t6Y/3I3qP1Jum7Ymeon+YHUkPYiJunL4nTeo6GFcj
	26rPAQcHTSmSyGZrHVSDegPxyDmFGVp+8X3/wRzCBL+HxO+qoMI1xH8bFo6/870+AUp1A7cBREU7Y
	kJQLVGj0SC37WAjjJ8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ulf-0000000GZbM-09mg;
	Fri, 13 Mar 2026 05:08:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ulX-0000000GZZ4-0SZR
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 05:08:56 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso731954a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Mar 2026 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773378529; x=1773983329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzQ3COQsCj6zOmna9aJpJTAQZrhsSwqcOS9nnDAte7Q=;
        b=E3FCoPW5TgQpxVTq9irw7lnhfjomiVAU+oOZLcTVcDZ89Or2ppS3ACgIWRJBRUcaXY
         7TkW1lHYWSAn0V+E8YwBzjdARHZzksDIl3SzqvZfW69Ed4YkdFJ4/vAj80yR5li6UsMf
         3JnrJXqSXrY3b/Wys8tJgFh/y161jBmmiUu6+OltYd+Zzr6W8Js5PWeosBJODR4mEJpq
         2UUwdm5LHcj/Bm7gjshurGJGJwWmduUCwegUTwM4g43NJlOPtzDx9dZJi2stTehO3VPN
         QyVYq+NScW924HWBna8yQSrLTYLAN9hCuC8jkzagKkjTi3ZAAUwhJF4/UAAdcY4TvgUc
         C7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773378529; x=1773983329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzQ3COQsCj6zOmna9aJpJTAQZrhsSwqcOS9nnDAte7Q=;
        b=a4xSkhhC4LtZJ8oVvzMQy/NN4usnbmkvFEDfrvialGcSHlrKMZbo8KoVJb9wuOcLFi
         OekKoaHxLE9vypdVD9TnZuxYqpsqV/IsKUpS6exEjD7Dgl+y0jtCk7uQC1dcy7mkyPl1
         UZenxUde0AX+01gWiEEo1D2qsYrOwSv+j7/zObuGZkAE0TC3iUWje6cgVY9iwFxcN6Ks
         Q2Jj0zeIdCgpDMxcVOteAytXB3BEIU0c7ucdnXE82ZJe3l/cRnsZzxlKkclPu4CS3u8O
         g90liVFkqaVHmNjn1S21Zq4ZvNPrafBvAHpSBp0q6uHvdrPTyiSF+SKYOjVRcZXyptGA
         KYRA==
X-Forwarded-Encrypted: i=1; AJvYcCUes/BTI08bIXW4iP/d1wdnlTT6GKNCrSM2t9wsPqAjC89keP9ZWUKqmQSQekmUy0Py7mMkEUiMfas=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJBGxE7mXdu7h5Cb9xxRHktQzSVmQdxbNAg4JvcN3raH7C9E40
	3MiE79jWkZmvbkmY9U7tfjEWT8Uca/+NRbOZ4n4NI1tTSD6tRr6E6ASK
X-Gm-Gg: ATEYQzxxDIxwfZEwQKaujQqhurjf3gkzJ+Zrovx4YPzDt1EwDI26spWFTKdwpKwW8Fn
	LDol5CqhMJBj49lee0XX07rd0Y+z6BlPnWiUtWHsJZCi8YzRsIDCQEh1Sdw69wVejXVWTId7WK+
	SsPlSAg7+csk8Gmo0njk29RFAaWBnM71Sl1vrljUduXLHjrPKRITuKT0KCS+5ytz0msjhdYX53T
	86Ph5WHZ4vEFY0wsQkQN0waYsRuYsZ72rzgORBbcioCJ3145DsvR7DUGtwPlWUMtU/HRq6GeBjQ
	bheOheMP4+/IAbg+3d7NQuvN7rZ66HlKtXBBREmdYF3PhbF/GKwWWOaqGX45DO21lOSgrsGklS/
	PjiJ6i2O/A3pvNM7fwTfjYv/iOx/zqvUZyDdODi11JXBPWci9l7+2AvuppWPsEol06Qog6MT/wz
	jtgtJUc8nVOTLmomslS2SNMRWCgErc5PcXc1LGjV0buVFGbHQoNI1BS3lhQF7cs9KaenYk
X-Received: by 2002:a05:6a21:6190:b0:395:7fb:9362 with SMTP id adf61e73a8af0-398eca9d72dmr1654010637.19.1773378529484;
        Thu, 12 Mar 2026 22:08:49 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97a1d7sm676221a12.6.2026.03.12.22.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:08:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	opensbi@lists.infradead.org
Subject: [kvm-unit-tests PATCH 1/2] riscv: sbi: dbtr: fix enable trigger return code check
Date: Fri, 13 Mar 2026 15:08:30 +1000
Message-ID: <20260313050831.4016944-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_220851_193032_C88B3854 
X-CRM114-Status: UNSURE (   8.63  )
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

Enabling triggers that are not mapped to a HW debug trigger
should return SBI_ERR_INVALID_PARAM.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 riscv/sbi-dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
index 129f79b8..489242b0 100644
--- a/riscv/sbi-dbtr.c
+++ b/riscv/sbi-dbtr.c
@@ -744,7 +744,7 @@ static void dbtr_test_uninstall_enable(struct sbi_dbtr_shmem_entry *shmem, enum
 	dbtr_uninstall_trigger();
 
 	ret = sbi_debug_enable_triggers(0, 1);
-	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_enable_triggers");
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_enable_triggers");
 
 	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
 
-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
