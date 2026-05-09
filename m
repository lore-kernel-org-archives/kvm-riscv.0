Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACC7CD37AF
	for <kvm-riscv@archiver.kernel.org>; Sat,  9 May 2026 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOk7bv9VaxYKWFmZQ4591KlTBaFtKVCRCEBykERQwBQ=; b=sEy94vI+msHFhL
	ZJHISfRXaAt9Pa5RnLOmXuWPNRQp05GfJE/D0qkPC8itvh5/kPcyd8cDgRFV17m0mVEba5yZph4Y9
	IY0dFqd8AcGkzUd0vVA3/DFzDrg6q+IXOYKp4fBiwG9XOCK8wN3mIR2tcT4jxs46Vl9da5TVoJzb5
	7ghZISUmvsRVe/YSNfIfixBd4SWO/S3xzkU/te2r+mfhFHJYjgeTdBlu446i6wax2XTr/8gE4KVmo
	69/4lq95z8JtPJkNrGvCyV+0GOebCzUvjEjr9ema/jLmozQkBpENGWfk48Mql0icr7Nmyx2HV//Go
	2WxA4XOdwluDtvicGbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhRq-00000009090-4BvU;
	Sat, 09 May 2026 13:10:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhRn-0000000907D-3R56
	for kvm-riscv@lists.infradead.org;
	Sat, 09 May 2026 13:10:25 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-836ebdeb969so1322638b3a.3
        for <kvm-riscv@lists.infradead.org>; Sat, 09 May 2026 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1778332223; x=1778937023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAkSYkxsqqTOgdXkwd1wAt3CxX5zO5z0PreuHh3BJZA=;
        b=lYG3cYs4GyK6r8ONRmLsairGcXUF0EqW09uvRscWbrpJUT4147ScaGDb5ZWh9EfZje
         sFGQgCdNyx1pcaj1QVUDKSXTobh68c4JQm9WGuimgRxTKuuWkWSqwKeyFj7/4lm9+Yav
         94rBeCeyVINz+jQXWfd6D+/1nUPwJX/tabgkg9GSAOHUh1Iu9yxzpSXjuBSg76gDtY/1
         nNzxjeHM88Pyjzd17EwUjcrocX9XoEmT7Zny3zDqeL6xHBxJO1+Z9ZhZQublJ8DING+z
         PN7bd7xneAKdv/hZdRLiI/DnUzBKYNKrn8EStBQn0Ca3dlnsvFcmjEVxDnO6+qYEhu7O
         yEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778332223; x=1778937023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PAkSYkxsqqTOgdXkwd1wAt3CxX5zO5z0PreuHh3BJZA=;
        b=l3WMHC9AKJlD+u5iYeVFSFv7FqGckVYmvi4VM4BCqE55ChS9cCPWk8PFJ4xIuUoznO
         ZSM08so2TzWF2o5o340l6cISVvOaGPcKzVUmIOGoReSTcdPVM7GWC+F4ruG3gE4O8zil
         sbtCVCKPYMO7mFV98ah2n7Y2iX7c9HnMK82NT2ikKsLAg4MaHXlsPZBpbjsjPUvUrCkO
         TmMZ8XzMjy7m4da8e0d3/726tlsOuzt+LYVbxUG1GJD4z9UvQNzYoXz9HITqX9JBVzIz
         qdCI5GA61tD6TV/5MxUlQeCo+LZtcm3S0825bIt6qHrvVozYwTtVs1PXvhV/dBtXYxPX
         pIzg==
X-Forwarded-Encrypted: i=1; AFNElJ+t9HYjbXAMBsN7mTPyNwfH36T2NsjEhsy65OvTyrGHG7a5k9g+wUyd9QnUVgDj49ZyQTWoC2b/xAo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwumZDRACCzvCfCm3rhiLR0zrrSdgWITttGni0Hjw5wzXhiCwI
	oLsTbm5X1gl2BRl+ne8GaxqGjRSUfW30jBviFhR5bS9bgamVPns5LAycMcagP3knxYc=
X-Gm-Gg: Acq92OGbYNBBW5SFfHy1ufDjZSr2twrhg5T8BGyVWP3d3BZWfTUog1r033hID88ZWlz
	jCE3aZCzsLM/QLuQlvx8cauHPxAr/kA8DLoM/4h4lozTORxSXznKVAJvGoFYv5PB9A4Jc2ZECMc
	Z3xWJCtZLoy6k1k0Nc1PVbG5cBmhkO4yRcnxZyzbveC5HFcLSWeWrInxnaGNU2EmPWwign9ZtJS
	IS06aYkUQuNKeXS43yhO8NzjQqneuSWOQe2z+7cLBpvOc6tP+d/RfIlspCtqtNLurUXIXPDTlEw
	ZMp8/0J7LkdH3oMnMvonCMTluVKCdp05so3W6WlrSQA6CugLGwCGZE7f62P+vgRi3e6hU4A75Ou
	pZdUm8tLKqWAxEuaQ+hJMcJeQ+njpScg+mfy9Vo6BFPnEzmAZrnhTcmNSj2MbYWdYmV6ciCuu6K
	29hf44wCKZiQWO+C2Mm2nhlobjqv4ky7QSHfnlQwQDZyhspVsuwcAFPdj6z6PFr0YVBcIopobdA
	ZNoHQ==
X-Received: by 2002:a05:6a00:8018:b0:82c:249e:a85b with SMTP id d2e1a72fcca58-83a5b7cd0famr17299719b3a.13.1778332222817;
        Sat, 09 May 2026 06:10:22 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([155.117.34.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm18552855b3a.28.2026.05.09.06.10.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 09 May 2026 06:10:22 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <himanshu@thechauhan.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Zhu Yuan <yuanzhu@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v9 1/5] riscv: add SBI SSE extension definitions
Date: Sat,  9 May 2026 21:09:58 +0800
Message-ID: <2a8913d680ccf162d5d697fde1a125c48b2f1d0a.1778331862.1.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_061024_224995_A050FB8E 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIG5lZWRlZCBk
ZWZpbml0aW9ucyBmb3IgU0JJIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIGV4dGVuc2lvbiBb
MV0uClRoaXMgZXh0ZW5zaW9uIGVuYWJsZXMgdGhlIFNCSSB0byBpbmplY3QgZXZlbnRzIGludG8g
c3VwZXJ2aXNvciBzb2Z0d2FyZQptdWNoIGxpa2UgQVJNIFNERUkuCgpbMV0gaHR0cHM6Ly9saXN0
cy5yaXNjdi5vcmcvZy90ZWNoLXBycy9tZXNzYWdlLzUxNQoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpDby1kZXZlbG9wZWQtYnk6IFpoYW5wZW5n
IFpoYW5nIDx6aGFuZ3poYW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPgpTaWduZWQtb2ZmLWJ5
OiBaaGFucGVuZyBaaGFuZyA8emhhbmd6aGFucGVuZy5qYXNwZXJAYnl0ZWRhbmNlLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgNjEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oCmluZGV4IDU3MjVlMGNhNGRkYS4uMzQwM2IwZjcwNmI0IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKQEAgLTM4LDYgKzM4LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX0ZXRlQg
PSAweDQ2NTc0NjU0LAogCVNCSV9FWFRfTVBYWSA9IDB4NEQ1MDU4NTksCiAJU0JJX0VYVF9EQlRS
ID0gMHg0NDQyNTQ1MiwKKwlTQklfRVhUX1NTRSA9IDB4NTM1MzQ1LAogCiAJLyogRXhwZXJpbWVu
dGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9F
WFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtNTA2LDYgKzUwNyw2NiBAQCBlbnVt
IHNiaV9tcHh5X3JwbWlfYXR0cmlidXRlX2lkIHsKICNkZWZpbmUgU0JJX01QWFlfQ0hBTl9DQVBf
U0VORF9XSVRIT1VUX1JFU1AJQklUKDQpCiAjZGVmaW5lIFNCSV9NUFhZX0NIQU5fQ0FQX0dFVF9O
T1RJRklDQVRJT05TCUJJVCg1KQogCitlbnVtIHNiaV9leHRfc3NlX2ZpZCB7CisJU0JJX1NTRV9F
VkVOVF9BVFRSX1JFQUQgPSAwLAorCVNCSV9TU0VfRVZFTlRfQVRUUl9XUklURSwKKwlTQklfU1NF
X0VWRU5UX1JFR0lTVEVSLAorCVNCSV9TU0VfRVZFTlRfVU5SRUdJU1RFUiwKKwlTQklfU1NFX0VW
RU5UX0VOQUJMRSwKKwlTQklfU1NFX0VWRU5UX0RJU0FCTEUsCisJU0JJX1NTRV9FVkVOVF9DT01Q
TEVURSwKKwlTQklfU1NFX0VWRU5UX0lOSkVDVCwKKwlTQklfU1NFX0hBUlRfVU5NQVNLLAorCVNC
SV9TU0VfSEFSVF9NQVNLLAorfTsKKworZW51bSBzYmlfc3NlX3N0YXRlIHsKKwlTQklfU1NFX1NU
QVRFX1VOVVNFRCAgICAgPSAwLAorCVNCSV9TU0VfU1RBVEVfUkVHSVNURVJFRCA9IDEsCisJU0JJ
X1NTRV9TVEFURV9FTkFCTEVEICAgID0gMiwKKwlTQklfU1NFX1NUQVRFX1JVTk5JTkcgICAgPSAz
LAorfTsKKworLyogU0JJIFNTRSBFdmVudCBBdHRyaWJ1dGVzLiAqLworZW51bSBzYmlfc3NlX2F0
dHJfaWQgeworCVNCSV9TU0VfQVRUUl9TVEFUVVMJCT0gMHgwMDAwMDAwMCwKKwlTQklfU1NFX0FU
VFJfUFJJTwkJPSAweDAwMDAwMDAxLAorCVNCSV9TU0VfQVRUUl9DT05GSUcJCT0gMHgwMDAwMDAw
MiwKKwlTQklfU1NFX0FUVFJfUFJFRkVSUkVEX0hBUlQJPSAweDAwMDAwMDAzLAorCVNCSV9TU0Vf
QVRUUl9FTlRSWV9QQwkJPSAweDAwMDAwMDA0LAorCVNCSV9TU0VfQVRUUl9FTlRSWV9BUkcJCT0g
MHgwMDAwMDAwNSwKKwlTQklfU1NFX0FUVFJfSU5URVJSVVBURURfU0VQQwk9IDB4MDAwMDAwMDYs
CisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTCT0gMHgwMDAwMDAwNywKKwlTQklfU1NF
X0FUVFJfSU5URVJSVVBURURfQTYJPSAweDAwMDAwMDA4LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJV
UFRFRF9BNwk9IDB4MDAwMDAwMDksCisKKwlTQklfU1NFX0FUVFJfTUFYCQk9IDB4MDAwMDAwMEEK
K307CisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NUQVRVU19TVEFURV9PRkZTRVQJMAorI2RlZmlu
ZSBTQklfU1NFX0FUVFJfU1RBVFVTX1NUQVRFX01BU0sJCTB4MworI2RlZmluZSBTQklfU1NFX0FU
VFJfU1RBVFVTX1BFTkRJTkdfT0ZGU0VUCTIKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NUQVRVU19J
TkpFQ1RfT0ZGU0VUCTMKKworI2RlZmluZSBTQklfU1NFX0FUVFJfQ09ORklHX09ORVNIT1QJQklU
KDApCisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX1NTVEFUVVNfU1BQ
CUJJVCgwKQorI2RlZmluZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19T
UElFCUJJVCgxKQorI2RlZmluZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfSFNUQVRV
U19TUFYJQklUKDIpCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19IU1RB
VFVTX1NQVlAJQklUKDMpCisKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ISUdIX1BSSU9f
UkFTCTB4MDAwMDAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ET1VCTEVfVFJBUAkJ
MHgwMDAwMDAwMQorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9ISUdIX1BSSU9fUkFTCTB4
MDAwMDgwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9QTVVfT1ZFUkZMT1cJMHgwMDAx
MDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0xPV19QUklPX1JBUwkweDAwMTAwMDAw
CisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX0xPV19QUklPX1JBUwkweDAwMTA4MDAwCisj
ZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkVfSU5KRUNURUQJMHhmZmZmMDAwMAor
I2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9TT0ZUV0FSRV9JTkpFQ1RFRAkweGZmZmY4MDAw
CisKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9QTEFURk9STQkJQklUKDE0KQorI2RlZmluZSBTQklf
U1NFX0VWRU5UX0dMT0JBTAkJQklUKDE1KQorCiAvKiBTQkkgZGVidWcgdHJpZ2dlcnMgZnVuY3Rp
b24gSURzICovCiBlbnVtIHNiaV9leHRfZGJ0cl9maWQgewogCVNCSV9FWFRfREJUUl9OVU1fVFJJ
R0dFUlMgPSAwLAotLSAKMi41MC4xIChBcHBsZSBHaXQtMTU1KQoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
