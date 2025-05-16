Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E14FC54754
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdK8usYYqxPj5cRmdXw2es1OLLWTNTUgi363EyJ+nqQ=; b=HITC9R1cxAyB+y
	TT4CGWoknkG902kwNV1y2reuzYUPuXU2U4H/MWcaTZ0PJs41VydNqxxQG6YWXFNvOUtMXabP0eTDX
	w7EtoxdLZsKbuGrG6mhYssurNWcotXgGkQp/GM9nHd1VogrWVuPunbxenJnpMizE+s2A1mPJXmOIu
	SA3GR0IHXMvDOYwgwxdZwcdik/96PrXqAlwZQmuVq18TlV0lsNYUjYK6f2z4qsjVX0yuVgzl/XDtt
	3HEZSEr8a7skxSThkIWJC9nGK+U21FCCNbQVXke1tNTlwc1Bvzg2RgUjiR2hANqHg3OcX4c1yoU89
	hX8FYhT92wQ2jIq9k8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwL5-00000003iEX-3WPH;
	Fri, 16 May 2025 14:47:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvkM-00000003cTO-2EPf
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 14:09:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so1202549f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 16 May 2025 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404549; x=1748009349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=smZiChKvNYw4iCCEUc1M+kA2f+BTdhPb8fmyJ7caorrFrzZTtZ1HfTmhlhSafbqxpu
         338hG5TA18KWaMOAk6vLbg8FOzUbj5MMmbY6RnDfAC0jeNzRJTM09gBdkeRMcOwXgqtt
         lOajps8ndqO0vH79G61IwmDb9lqfICw5pvk1Q3FGsCV/3A8POEkSKp8kQ9bAJY4yMnc9
         70ZD8/DDy48XWoPjT7hvl+hx+hL27C+zwSo05ELHyqPERizYj3LoWL7gf0dshMNu/D8E
         QH/l4ZRhuxXHrD1WZuhHFD3WPS74yW5N+r5Lq/60n1EY0GBBLXgNzXUkztPOUlLBWtZ1
         W7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404549; x=1748009349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=aGdOhHFiduLxoV6MEk0As1c+zCTXbMXGZI2/HPDQdoZc8G/Us+6GhMcOlwIe9erPFN
         G1+tEbQ9qBVn+IX0XzNH3boGfL9br/K/5H57ECDiFSlPWS3RU/zGJjb3ps/aFsjcEdPH
         bF4cOQYyjtUSEBemnfWLWu88dJNKK1T7Wnq3v0PPPaIPaTvyzOPWwnSzzyXOPJ+Itryy
         mreNSNl6OxImzxozkJYgXpE4CCGm8LvLFwng63RHgtOUGVirJD2NP92ll59YDaHVxCLo
         VCPHlAF7fWcD3aeqinbJBtuAOJxDo7LYzoKpPYpkQ77C+b+nGaz6l1VGwq+PGbcM+d9a
         tjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh244fZB+H9QBINMj+KyzyF1Nw+WD4QtIIT838ADZzJnE8HlkOCSlP2SJYJ5LEovL2GMsl4ram9Zk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPvfdOmVMWl0n40pa7mDm6VVWCgn9oKI9LsciI8mzd9Af3Uz0Q
	rWzbiRUwzwHyLM4I52ECJfw2LtIEp3yQc7tInh0sxSgtL75DGn5smzxaMKpdZrPi13o=
X-Gm-Gg: ASbGncuAHdl+IFyEFc71MkPo5/K+x96PXf/xGv4JHMUMrM8XCQ8UyyK6K5RKbZSii/I
	hzMhmV99QaHDaQvxz0nFde1Ce18kVxk6TiA/L7OQpb6lIFOzpvM6CTFi1dXSuGlyYacrbbEJsSh
	TDPFp8sO2o6h8oMb82DbNAnsfJcty38CNrT5ud0kB5VNRsObpi636A9KCaalfNyMwu4/KJXF68R
	ApqOc+rJlncq6XWSFiKSgtEMYqmSPWVbmCvZFApNQk56GqgpFECgp6QiNVkEj59kQnFpQnm/AXb
	7u1kt6GtfsjlJWTcz5nvJc9BaXuBzEo59cIMR1Z+Nu8ZxdZvmOBU58T6gDqcrw==
X-Google-Smtp-Source: AGHT+IGcNulM7sZqj+PyskZzsBcL0kYBhlh4zFQiDSGNh6LWyJKYUr6QraGKOEQ7UWTVlqgDlJSF9A==
X-Received: by 2002:a05:6000:1866:b0:3a3:4a1a:de6f with SMTP id ffacd0b85a97d-3a35feab1bdmr2405504f8f.26.1747404548777;
        Fri, 16 May 2025 07:09:08 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1f9sm2911696f8f.1.2025.05.16.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:09:08 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Fri, 16 May 2025 16:08:03 +0200
Message-Id: <20250516140805.282770-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250516140805.282770-1-alexghiti@rivosinc.com>
References: <20250516140805.282770-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_070910_584146_B8C29C29 
X-CRM114-Status: GOOD (  10.54  )
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

U2ltcGx5IGZpeCBhIHR5cG8uCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDA5
ZmRlOTVhNWU4Zi4uMmE1ODlhNThiMjkxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaApAQCAtMzUyLDcg
KzM1Miw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9pbnNuX2lzX2NfamFs
cih1MzIgY29kZSkKIAkoe3R5cGVvZih4KSB4XyA9ICh4KTsgUlZfWCh4XywgUlZGRFFfRkxfRlNf
V0lEVEhfT0ZGLCBcCiAJCQkJICAgUlZGRFFfRkxfRlNfV0lEVEhfTUFTSyk7IH0pCiAKLSNkZWZp
bmUgUlZWX0VYUkFDVF9WTF9WU19XSURUSCh4KSBSVkZEUV9FWFRSQUNUX0ZMX0ZTX1dJRFRIKHgp
CisjZGVmaW5lIFJWVl9FWFRSQUNUX1ZMX1ZTX1dJRFRIKHgpIFJWRkRRX0VYVFJBQ1RfRkxfRlNf
V0lEVEgoeCkKIAogLyoKICAqIEdldCB0aGUgaW1tZWRpYXRlIGZyb20gYSBKLXR5cGUgaW5zdHJ1
Y3Rpb24uCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IDE4NGY3ODBjOTMyZC4uOTAxZTY3YWRmNTc2IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYwpAQCAtOTMsNyArOTMsNyBAQCBib29sIGluc25faXNfdmVjdG9yKHUzMiBpbnNu
X2J1ZikKIAkJcmV0dXJuIHRydWU7CiAJY2FzZSBSVlZfT1BDT0RFX1ZMOgogCWNhc2UgUlZWX09Q
Q09ERV9WUzoKLQkJd2lkdGggPSBSVlZfRVhSQUNUX1ZMX1ZTX1dJRFRIKGluc25fYnVmKTsKKwkJ
d2lkdGggPSBSVlZfRVhUUkFDVF9WTF9WU19XSURUSChpbnNuX2J1Zik7CiAJCWlmICh3aWR0aCA9
PSBSVlZfVkxfVlNfV0lEVEhfOCB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lEVEhfMTYgfHwKIAkJ
ICAgIHdpZHRoID09IFJWVl9WTF9WU19XSURUSF8zMiB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lE
VEhfNjQpCiAJCQlyZXR1cm4gdHJ1ZTsKLS0gCjIuMzkuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
