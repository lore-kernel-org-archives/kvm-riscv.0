Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBD5C7EE32
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CE8JX8pQTlHP6uUwaFGuKcACtrvwlrWr5KjetQnwABU=; b=l41A5LvtWXygDC
	HYzEjEzIj+X3ORQwWFuE4EdRDTJsLE4Zsh4cb+ZIRmHlZ9CWzYKnn0JAipqXA/vicljtn0FG/zHOr
	3Bj70tjQWdtBF50QKG5HP3YIh0739tbi0WVlomb2hyYu5IkmvcrgtK+XFAO9DGshdzWHahrE3LoF/
	QxhFy+buT2e2lL5pHM2nSdniPDEmxs4slyZL5uTcPy7S7aBO1KVXoiGo+pSqcmE48uz+LEq5cu1N2
	xTNA3zKC4IG3MD+sneJFfM08e/J5qecN45tic3D4AHR/p32kJbds7Ul+1htxTNEF8O+5umOFrPd12
	6qmuICUl4n6QWAFZBc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk4R-00000003QxL-3K56;
	Mon, 23 Jun 2025 16:30:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgxr-00000002pjR-3o3V
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 13:12:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-236470b2dceso42524925ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750684319; x=1751289119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wO40UEYL1TOuOO8GH3Tf8VplVaUYok6E8UthE4M71c=;
        b=C7dKFl+to2o66wNtXuotkBSZaKBiwfHSTnizcDMQsFkMWVQwS1d+YfAmHdh8OdF/ww
         xwH4n2GFyuKqbk/W9az47IUOfqbdlJI9xk9tWddWTQfHH9e/KiGdOyy90G6i7Kz7YhH0
         NTF47Dc2rUicx58dZT9sM3+enBBZg/Qnt6Fe0GtWe/txrx4eYobM/lXR2+w6a9WagdAA
         /QG4A2S4/gE84o2kvi6mCnOnKae8fh0s3OcaGhr0TnHAXfNZ8EjzqvLMmwp41GE5R+aO
         ifzrHxGsYZDuR/bwAqH0AxU+AgjQw11CSUbvSS6b3DoUgnKj+/zdiLZSFkuzaiIA1SuM
         U5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750684319; x=1751289119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wO40UEYL1TOuOO8GH3Tf8VplVaUYok6E8UthE4M71c=;
        b=r7ZMyxkdRwmPbV+uhJnfLnss5pVPm6j4vF4QcBgYIcpyvzN/Z9xdc7ilTiKDEATmtD
         Cesuok0AS8rixuz1R0sYhpVyKVxICSOPDQKlLaDHlTdgQ0aiVAFCf+wUPLC3R24ld8mE
         GHq2TzgC3fMqVs/26YvtW9G5SKwAPNkTvZEyQESRn0odTd68xDSOBFfJdmi/sgV+9X/y
         NoAgPwdecxUKIJGT13AiLL0KcBA5i+AqoahIfPkZP3behK9zDRbSnvRGmgULTeciATVM
         3lRCsPIh8G01syi4edoE26ImTcLLXv0NWVGUCtgOpb7ssmuXXj3beTPDfKUunMeMGFzh
         uA1w==
X-Forwarded-Encrypted: i=1; AJvYcCUoCw69AaTga00DApisrJNN7V7OVMPAvrho9cIfrQaAERrYnCedwwW6JAxoY9xqveeTMPuVk9h/aHw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3y/FbPrNQ7wTCHjlqEpXWgFDCvsEZfk8XXlYzdFSljSs0Eg17
	uANps5MmlL7kZyoCxN3vAZWnkDmHGs+q0qfDG18/NPKqA2DtYj1q4b1HrHO2QLPk7L8=
X-Gm-Gg: ASbGncspU44h4QO7iu1xqH3W0MXxvHpgTNGO6RPGvrNAnOGcmopKboEx2LvwoppOOUY
	dEDXSk0p/hNMJ28L30h6w5YFLW29U5Ei14DHONNt2Qmk6B0m86vxs8uDfKP2oaM7iSHtob9S+d3
	582AoUJFnLhEj8KvI/o+NGAHFuUQh2Fo2M9Id9wKJ5dHkpWgJ0+VneeSwRjLXaMM6CgDFsEtF3b
	1f0rGRYTyzll50bRbN6XwAVfbNvE/UmNwusNwG9gLFSjdqcd/BidC36K3ldpMZ2lOhQTaAPb+VE
	jeBBW/55i89qusHXjMHStCnRj6k+D8SG+WnaI/1J857UUuI5N2BH4P8YYX62xu0UDDI=
X-Google-Smtp-Source: AGHT+IHGnWg7T8K3upw5rqWnwqHw9IUwaNFs5TOMJRCFjVb/HqcR57ibOi0eIALkq+iQYSGfCurjdw==
X-Received: by 2002:a17:903:1a08:b0:235:f45f:ed41 with SMTP id d9443c01a7336-237d9918352mr184336675ad.19.1750684319204;
        Mon, 23 Jun 2025 06:11:59 -0700 (PDT)
Received: from carbon-x1.home ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8673d1asm84314385ad.172.2025.06.23.06.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:11:58 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [kvm-unit-tests PATCH 3/3] riscv: sbi: sse: Use READ_ONCE()/WRITE_ONCE() for shared variables
Date: Mon, 23 Jun 2025 15:11:25 +0200
Message-ID: <20250623131127.531783-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623131127.531783-1-cleger@rivosinc.com>
References: <20250623131127.531783-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_061159_948122_106C3342 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

VXNlIFJFQURfT05DRSgpIGFuZCBXUklURV9PTkNFKCkgZm9yIHZhcmlhYmxlcyB0aGF0IGFyZSBz
aGFyZWQgYmV0d2Vlbgp0aGUgU1NFIGhhbmRsZXIgYW5kIHRoZSBtYWluIHByb2Nlc3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogcmlz
Y3Yvc2JpLXNzZS5jIHwgMTQgKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLXNzZS5jIGIv
cmlzY3Yvc2JpLXNzZS5jCmluZGV4IDViZmM3YTA3Li4wZGZhYmFjYiAxMDA2NDQKLS0tIGEvcmlz
Y3Yvc2JpLXNzZS5jCisrKyBiL3Jpc2N2L3NiaS1zc2UuYwpAQCAtOTE4LDE1ICs5MTgsMTYgQEAg
c3RhdGljIHZvaWQgc3NlX2xvd19wcmlvcml0eV90ZXN0X2hhbmRsZXIodm9pZCAqYXJnLCBzdHJ1
Y3QgcHRfcmVncyAqcmVncywKIAkJCQkJICB1bnNpZ25lZCBpbnQgaGFydGlkKQogewogCXN0cnVj
dCBwcmlvcml0eV90ZXN0X2FyZyAqdGFyZyA9IGFyZzsKLQlzdHJ1Y3QgcHJpb3JpdHlfdGVzdF9h
cmcgKm5leHQgPSB0YXJnLT5uZXh0X2V2ZW50X2FyZzsKKwlzdHJ1Y3QgcHJpb3JpdHlfdGVzdF9h
cmcgKm5leHQgPSBSRUFEX09OQ0UodGFyZy0+bmV4dF9ldmVudF9hcmcpOwogCi0JdGFyZy0+Y2Fs
bGVkID0gdHJ1ZTsKKwlXUklURV9PTkNFKHRhcmctPmNhbGxlZCwgdHJ1ZSk7CiAKIAlpZiAobmV4
dCkgewogCQlzYmlfc3NlX2luamVjdChuZXh0LT5ldmVudF9pZCwgY3VycmVudF90aHJlYWRfaW5m
bygpLT5oYXJ0aWQpOwogCiAJCXJlcG9ydChzc2VfZXZlbnRfcGVuZGluZyhuZXh0LT5ldmVudF9p
ZCksICJMb3dlciBwcmlvcml0eSBldmVudCBpcyBwZW5kaW5nIik7Ci0JCXJlcG9ydCghbmV4dC0+
Y2FsbGVkLCAiTG93ZXIgcHJpb3JpdHkgZXZlbnQgJXMgd2FzIG5vdCBoYW5kbGVkIGJlZm9yZSAl
cyIsCisJCXJlcG9ydCghUkVBRF9PTkNFKG5leHQtPmNhbGxlZCksCisJCSAgICAgICAiTG93ZXIg
cHJpb3JpdHkgZXZlbnQgJXMgd2FzIG5vdCBoYW5kbGVkIGJlZm9yZSAlcyIsCiAJCSAgICAgICBz
c2VfZXZlbnRfbmFtZShuZXh0LT5ldmVudF9pZCksIHNzZV9ldmVudF9uYW1lKHRhcmctPmV2ZW50
X2lkKSk7CiAJfQogfQpAQCAtOTc3LDkgKzk3OCw5IEBAIHN0YXRpYyB2b2lkIHNzZV90ZXN0X2lu
amVjdGlvbl9wcmlvcml0eV9hcmcoc3RydWN0IHByaW9yaXR5X3Rlc3RfYXJnICppbl9hcmdzLAog
CQlldmVudF9hcmctPnN0YWNrID0gc3RhY2s7CiAKIAkJaWYgKGkgPCAoYXJnc19zaXplIC0gMSkp
Ci0JCQlhcmctPm5leHRfZXZlbnRfYXJnID0gYXJnc1tpICsgMV07CisJCQlXUklURV9PTkNFKGFy
Zy0+bmV4dF9ldmVudF9hcmcsIGFyZ3NbaSArIDFdKTsKIAkJZWxzZQotCQkJYXJnLT5uZXh0X2V2
ZW50X2FyZyA9IE5VTEw7CisJCQlXUklURV9PTkNFKGFyZy0+bmV4dF9ldmVudF9hcmcsIE5VTEwp
OwogCiAJCS8qIEJlIHN1cmUgZ2xvYmFsIGV2ZW50cyBhcmUgdGFyZ2V0aW5nIHRoZSBjdXJyZW50
IGhhcnQgKi8KIAkJaWYgKHNiaV9zc2VfZXZlbnRfaXNfZ2xvYmFsKGV2ZW50X2lkKSkgewpAQCAt
MTAxOSw3ICsxMDIwLDggQEAgc3RhdGljIHZvaWQgc3NlX3Rlc3RfaW5qZWN0aW9uX3ByaW9yaXR5
X2FyZyhzdHJ1Y3QgcHJpb3JpdHlfdGVzdF9hcmcgKmluX2FyZ3MsCiAJLyogQ2hlY2sgdGhhdCBh
bGwgaGFuZGxlcnMgaGF2ZSBiZWVuIGNhbGxlZCAqLwogCWZvciAoaSA9IDA7IGkgPCBhcmdzX3Np
emU7IGkrKykgewogCQlhcmcgPSBhcmdzW2ldOwotCQlyZXBvcnQoYXJnLT5jYWxsZWQsICJFdmVu
dCAlcyBoYW5kbGVyIGNhbGxlZCIsIHNzZV9ldmVudF9uYW1lKGFyZy0+ZXZlbnRfaWQpKTsKKwkJ
cmVwb3J0KFJFQURfT05DRShhcmctPmNhbGxlZCksICJFdmVudCAlcyBoYW5kbGVyIGNhbGxlZCIs
CisJCSAgICAgICBzc2VfZXZlbnRfbmFtZShhcmctPmV2ZW50X2lkKSk7CiAJfQogCiBlcnI6Ci0t
IAoyLjUwLjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
