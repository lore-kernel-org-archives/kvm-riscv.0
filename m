Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F35C35FF7
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBV7iQSv75AqqwDhg5jV7c+2Jniv75ql4P8rYp19qHE=; b=d27FcaH9iYESac
	bj8QI3HCyvT6g04u5WWqEmBEqEAFHXlAVpwEhAR50U7b1MGMX+8rhF0cKBQRanBLe/zseGhPUc5CR
	3pPIc72MV3/Py9mSGMPt9Oei8cYvNs7yqrPLjDjYGFzAQSrQ6vDg+/uEFv6i+8LbDIMcvxygYDS4c
	cgoT6xj/GG/rouQStiC1AMnKB0faSmQIDpc84S+CbcQFttWgrZvK15EwiskJYr2Uwn82nd6hiLs6k
	+RHTLOXN59dOgAFVRpbTytkjAjLq0/DkwW4JXBJ+rTMmJcW18aeHBvbBoz5ahdImwdm1eV5wWyIaT
	wjsFw1CSdC2TXVJhoDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLy-00000003G2l-0aMi;
	Mon, 10 Mar 2025 15:47:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepP-000000037rR-0Gqp
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22435603572so42315175ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619642; x=1742224442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=sIWiSGeaaYiTiz5eDV/+CIVr+sOLZzK9JjZcSvi/YcTMkFZcW468BSAT8yYcxdWmZv
         MSA2xP5+YWsR0OUOb00/o3v8WUMrB3nWrkgJ69xSh6tD5ZmroLCrjgLQNFq+yKR7gsXW
         kN+sYbVNDQ+lvsOrYcyeZ7/FNlaXx0xXKZeSpXdW9mWqIeHc9Rw+n6Y5Icfar7W1YCX9
         vK1qPpce4Fm2zVZxmDyqAC0m2/8z0lnKN4I3X8RQFvYazHMgwUNaOj3Dz5A8f3swBMoj
         5VGLOHSVZ1XZpWVfRoIEWnRk5LeCtOOniLdAd7XYGpizTlgfAt6hkY8daTwpLSOPzvGw
         J+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619642; x=1742224442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=dwmI43jRM+a/nSS8FiK9lRP1B9xfslSEl3ngm6FMLxqATORrlF2PCwmPoTg4uGiev2
         scvlQ+iUlo6x+j/cw66cQo4XjgCvQVz862d8oOXFdKGtTajnR/79AFCN6lUqAT9/Oj+R
         AsnwmRpYYHXc9CkQ479PKzlhU7efz8Bms2PG9o9TTz5ioGdbAI2Kp1uxQ4E8CQDI0vBH
         dhQyIrRS5R+rqduliA/HxpXezWa4XXifAIV6xmYQWh+n6fVv1/YAj+5B9Ah6xdrkUEXP
         XtQl9lq6+Coz0EKi/OELq66nFrVV1nnR8RYZIFBbSw2sUnmJG0pEzMqn0FhdLKjVP+ac
         caBA==
X-Forwarded-Encrypted: i=1; AJvYcCVp2eeFn4k0cNnPxQoXstAINtyaQkfQAK76cIhNX8WkWozLMPFZMbjTEkEh7vA/YCuassxzcu3vGZY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6xta5t4xXWztK8Xg0621LeNvHbt4vifnJirnG7jD2/q76xH1c
	xCSPE2d1ohCCmGw1sDsEokac6lre8hl78ZEnoKnODaEcOtUk9t6OuxuY3jJqHQk=
X-Gm-Gg: ASbGnctewFoF5rxi65P8paH4LNIgMOwfUowgaOFpon4dCf1EXOIN0Ak+c+zVYK/HMKQ
	J81qfrj2jf8cY+UsWG8NpN956q3+5fr88fw8oJjQzrKvEKt+4RXdpSY3/pqCAKzCpvCRy3XUo5W
	nmzqrZUnfOZ67q9W6PzxXb5wIolU2x7Cv3C15p2A7dJ7edVYRmq/YJ33FF929SGv/tR6iK6wqUr
	KeNyu5JfX4PoD2iz1AHMLrrML9MHVB2WUM0sZJLI9R6SkXIc4vtxmD22lYaqEQ1nICQb6AU8qX5
	c31mBgbAQazZgd8HJCX7PHjmr/lTr5Wx4MZu5c2Ma+Dv4g==
X-Google-Smtp-Source: AGHT+IE/Wftdkd3zlZdL/ywUH78DLaDAVcrFF4WfEuA9Q1JYQZM9C8xhDZMPOQ9HkccIr+uMejIbbw==
X-Received: by 2002:a17:903:298b:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22428c221dbmr239345965ad.49.1741619642512;
        Mon, 10 Mar 2025 08:14:02 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:02 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 09/17] riscv: misaligned: factorize trap handling
Date: Mon, 10 Mar 2025 16:12:16 +0100
Message-ID: <20250310151229.2365992-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081403_102378_177268A2 
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

bWlzYWxpZ25lZCBhY2Nlc3NlcyB0cmFwcyBhcmUgbm90IG5taSBhbmQgc2hvdWxkIGJlIHRyZWF0
ZWQgYXMgbm9ybWFsCm9uZSB1c2luZyBpcnFlbnRyeV9lbnRlcigpL2V4aXQoKS4gU2luY2UgYm90
aCBsb2FkL3N0b3JlIGFuZCB1c2VyL2tlcm5lbApzaG91bGQgdXNlIGFsbW9zdCB0aGUgc2FtZSBw
YXRoIGFuZCB0aGF0IHdlIGFyZSBnb2luZyB0byBhZGQgc29tZSBjb2RlCmFyb3VuZCB0aGF0LCBm
YWN0b3JpemUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQ5ICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDhmZjhlOGIzNjUyNC4uNTVk
OWYzNDUwMzk4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTE5OCw0NyArMTk4LDM4IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVnYWwoc3RydWN0
IHB0X3JlZ3MgKnJlCiBET19FUlJPUl9JTkZPKGRvX3RyYXBfbG9hZF9mYXVsdCwKIAlTSUdTRUdW
LCBTRUdWX0FDQ0VSUiwgImxvYWQgYWNjZXNzIGZhdWx0Iik7CiAKLWFzbWxpbmthZ2UgX192aXNp
YmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCitlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgeworCU1JU0FMSUdORURf
U1RPUkUsCisJTUlTQUxJR05FRF9MT0FELAorfTsKKworc3RhdGljIHZvaWQgZG9fdHJhcF9taXNh
bGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUg
dHlwZSkKIHsKLQlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Ci0JCWlycWVudHJ5X2VudGVyX2Zyb21f
dXNlcl9tb2RlKHJlZ3MpOworCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRl
cihyZWdzKTsKIAorCWlmICh0eXBlID09ICBNSVNBTElHTkVEX0xPQUQpIHsKIAkJaWYgKGhhbmRs
ZV9taXNhbGlnbmVkX2xvYWQocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywg
QlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlz
YWxpZ25lZCIpOwotCi0JCWlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOworCQkJCSAg
ICAgICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsKIAl9IGVsc2UgewotCQlpcnFl
bnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwotCi0JCWlmICho
YW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQorCQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3Rv
cmUocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVn
cy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwotCi0J
CWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKKwkJCQkgICAgICAiT29wcyAtIHN0b3Jl
IChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwogCX0KKworCWlycWVudHJ5X2V4aXQocmVn
cywgc3RhdGUpOwogfQogCi1hc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lk
IGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKK2FzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0JaWYgKHVzZXJfbW9kZShyZWdzKSkgewotCQlpcnFl
bnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKLQotCQlpZiAoaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFM
TiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9yIEFNTykgYWRkcmVzcyBtaXNhbGln
bmVkIik7Ci0KLQkJaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Ci0JfSBlbHNlIHsK
LQkJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKLQot
CQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJl
Z3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9y
IEFNTykgYWRkcmVzcyBtaXNhbGlnbmVkIik7CisJZG9fdHJhcF9taXNhbGlnbmVkKHJlZ3MsIE1J
U0FMSUdORURfTE9BRCk7Cit9CiAKLQkJaXJxZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUpOwot
CX0KK2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zdG9y
ZV9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCWRvX3RyYXBfbWlzYWxpZ25l
ZChyZWdzLCBNSVNBTElHTkVEX1NUT1JFKTsKIH0KKwogRE9fRVJST1JfSU5GTyhkb190cmFwX3N0
b3JlX2ZhdWx0LAogCVNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAic3RvcmUgKG9yIEFNTykgYWNjZXNz
IGZhdWx0Iik7CiBET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfcywKLS0gCjIuNDcuMgoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
