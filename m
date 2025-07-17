Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE3C83F34
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSlhLvvLTqBNOwrZKYlQ6iAWvo4pCFcIk3GDqt46Qt8=; b=huezVBro7Dquv2
	3AYcWRjWbQXYrv7tq8XXy5iyj9lFAo4GRZHPflb4xMEqM5JMYsopiNkpoTKggjY4JIqyY3AOBVS/R
	IHPvLq5OlN02THuGhwVulZ+bTnCvXEG6ydNLo5Q5hmHfilrQPehTip2SxjQ4Pck3Tytdl5al2Rld+
	p1cxZKXY7bNfMvpst7Ohwcgmc0ZFm1JEoH9+P6BuZ8F7bfeHY7uhca6WojmL4ekFbbXTi50RnH9EA
	yRkzdksY4XtNs9yoKWNIIYcdAdZOarSmAoSjr1eVwnFdFEfOTjYWwypbNHQBFIKbfftYGKoH/ttIy
	paQyMaKJHZBd+AtTw8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucS4W-0000000Ajlr-1gBg;
	Thu, 17 Jul 2025 17:07:04 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQMK-0000000AUbp-0eF8
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:17:21 +0000
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e278d8345aso101149785a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765439; x=1753370239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=;
        b=y8j+V2JPRLq5DN9EM0JXfolPVulIMPfggjRtrcYqM8NMiVLXTtzNMyAYSEB/GQ/biz
         yYd/JdE81TP5XNj4Booa+6k1SiRI5tcSqGk+TawLZNeqMtRYuiXzMb62oVNg/QlQZJtO
         5zgHIi4umO6qBKmEgGUL6xY8/HtxAfe2w1jiE6aNOWXKuUJENik2wYtZ2w6C3DVc3/hY
         YAywYvdLUeUd5a0CttmmLHqVyk3jyRAMV11psd+hEI4gcyndG7FwEkYN2X6n1z7fOSbM
         WNSEta7I0tfj9zYb7/0VxKl3MQgxdbCdb/aJWj4Jz70s8Oyxc84dt9S/WFQyqle4L/9v
         dOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765439; x=1753370239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=;
        b=lDPqrlcf40bU477g89AsAUk8wu+OQvwA7uCQsjotX3VLN8Y6t+l/ZTn6JPyt7R+Rr5
         G1GSsg+YK3udIW8DfRo6V7E14FUxUaJnBn13QfNBUV+JSc5dC7JtgNacOaC+Z3YzWCdu
         1v72nvSPkDoX37M+ybS7NecPJFdUENioLZ2xQ2g/Nj9PWsAGUoXgBIyjxW89bf4Hp9hi
         TXvJ431IT3bId1aro6bg07qnUfp6bM+j3ULZE6HM/5yQnWKOryQtksFexul5edieHrsM
         1unvcIWj/0/lHcv6puncL3K8u1Il4Rj7ZqvMughutXHi6Mtbh+Ig382MIGq71QPZBthL
         bC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpSf9bhzF7JO2e6YGJfLpxQyJ6mQopjjAMnVi9A7qEZe+3rp6skVZHIX8fZmecQy3pFDShlU1w+Hw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRlRkjnENT6op2t5meMfn9ctbT/JhEojKKw4bMr9CmKB7NhETU
	jFq6khPsI20DAL0uE2aTcmu9rkAyDkiqa504zLZg2XlyUewUmi7tqTilSJFFBWqfT49Ca6uw/vJ
	fytkWTAipYBRC6HsLutiyXVDM+1sSwaMr8wJ8eF3Vxg==
X-Gm-Gg: ASbGncssKkJUOms5AOXCL2o4WUnmV811j5vUKBma+H8ectBglqZsQnbSMYHmGIDQlCi
	oChX/tR58WX5ibTCAq0h5YF8jp+7SfWPoPIyG3Ys4vCOl+PLRYKRNt4+IdwQKzEKrVs3YYBoQU2
	c2rWMKezyVJUv06o9+7TMWaDWUh+SxXv8JSg1gMoxJpaaUXcnN5YMbfR+KzsGtu532KZ/7zPRld
	MyYjelK
X-Google-Smtp-Source: AGHT+IHz2ooSEYMwChi5WNQfJsDufDgq6WJG7AmXKC3wtaW/L8MYe8nihHSBFgq+2TYbHnsMVgzMJk9i+88DE/6bDYA=
X-Received: by 2002:a05:620a:7017:b0:7c5:5fa0:4617 with SMTP id
 af79cd13be357-7e343615e30mr946456785a.40.1752765438473; Thu, 17 Jul 2025
 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:47:06 +0530
X-Gm-Features: Ac12FXzD0efP_qu0iiVx1ulFC3dW-BDJaKPty1r8E1h77LH8P4Y_H1glg7EyAyo
Message-ID: <CAAhSdy02kKJ0PHjyeGaV1-pC3DVL8-VcQ=EB+ha69=_CAQb2xg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drivers/perf: riscv: Add raw event v2 support
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081720_187554_E6F5A40E 
X-CRM114-Status: GOOD (  22.57  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTQkkgdjMuMCBpbnRyb2R1Y2VkIGEgbmV3IHJhdyBldmVu
dCB0eXBlIHRoYXQgYWxsb3dzIHdpZGVyCj4gbWhwbWV2ZW50WCB3aWR0aCB0byBiZSBwcm9ncmFt
bWVkIHZpYSBDRkdfTUFUQ0guCj4KPiBVc2UgdGhlIHJhdyBldmVudCB2MiBpZiBTQkkgdjMuMCBp
cyBhdmFpbGFibGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8ICA0ICsrKysK
PiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDE2ICsrKysrKysrKysrKy0tLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NiaS5oCj4gaW5kZXggM2QyNTA4MjQxNzhiLi42Y2UzODVhM2E3YmIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKPiBAQCAtMTYwLDcgKzE2MCwxMCBAQCBzdHJ1Y3QgcmlzY3ZfcG11X3Nu
YXBzaG90X2RhdGEgewo+Cj4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLIEdFTk1B
U0tfVUxMKDQ3LCAwKQo+ICAjZGVmaW5lIFJJU0NWX1BNVV9QTEFUX0ZXX0VWRU5UX01BU0sgR0VO
TUFTS19VTEwoNjEsIDApCj4gKy8qIFNCSSB2My4wIGFsbG93cyBleHRlbmRlZCBocG1ldmVudFgg
d2lkdGggdmFsdWUgKi8KPiArI2RlZmluZSBSSVNDVl9QTVVfUkFXX0VWRU5UX1YyX01BU0sgR0VO
TUFTS19VTEwoNTUsIDApCj4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFggMHgyMDAw
MAo+ICsjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfSURYIDB4MzAwMDAKPiAgI2RlZmlu
ZSBSSVNDVl9QTEFUX0ZXX0VWRU5UICAgIDB4RkZGRgo+Cj4gIC8qKiBHZW5lcmFsIHBtdSBldmVu
dCBjb2RlcyBzcGVjaWZpZWQgaW4gU0JJIFBNVSBleHRlbnNpb24gKi8KPiBAQCAtMjE4LDYgKzIy
MSw3IEBAIGVudW0gc2JpX3BtdV9ldmVudF90eXBlIHsKPiAgICAgICAgIFNCSV9QTVVfRVZFTlRf
VFlQRV9IVyA9IDB4MCwKPiAgICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9DQUNIRSA9IDB4MSwK
PiAgICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9SQVcgPSAweDIsCj4gKyAgICAgICBTQklfUE1V
X0VWRU5UX1RZUEVfUkFXX1YyID0gMHgzLAo+ICAgICAgICAgU0JJX1BNVV9FVkVOVF9UWVBFX0ZX
ID0gMHhmLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gaW5kZXggY2ZkNjk0NmZjYTQyLi4y
NzNlZDcwMDk4YTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+
ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBAQCAtNTksNyArNTksNyBAQCBh
c20gdm9sYXRpbGUoQUxURVJOQVRJVkUoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAjZGVmaW5lIFBFUkZfRVZFTlRfRkxBR19VU0VSX0FDQ0VTUyAgICBC
SVQoU1lTQ1RMX1VTRVJfQUNDRVNTKQo+ICAjZGVmaW5lIFBFUkZfRVZFTlRfRkxBR19MRUdBQ1kg
ICAgICAgICBCSVQoU1lTQ1RMX0xFR0FDWSkKPgo+IC1QTVVfRk9STUFUX0FUVFIoZXZlbnQsICJj
b25maWc6MC00NyIpOwo+ICtQTVVfRk9STUFUX0FUVFIoZXZlbnQsICJjb25maWc6MC01NSIpOwo+
ICBQTVVfRk9STUFUX0FUVFIoZmlybXdhcmUsICJjb25maWc6NjItNjMiKTsKPgo+ICBzdGF0aWMg
Ym9vbCBzYmlfdjJfYXZhaWxhYmxlOwo+IEBAIC01MjcsOCArNTI3LDEwIEBAIHN0YXRpYyBpbnQg
cG11X3NiaV9ldmVudF9tYXAoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1NjQgKmVjb25maWcp
Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBQRVJGX1RZUEVfUkFXOgo+
ICAgICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAgKiBBcyBwZXIgU0JJIHNwZWNp
ZmljYXRpb24sIHRoZSB1cHBlciAxNiBiaXRzIG11c3QgYmUgdW51c2VkCj4gLSAgICAgICAgICAg
ICAgICAqIGZvciBhIGhhcmR3YXJlIHJhdyBldmVudC4KPiArICAgICAgICAgICAgICAgICogQXMg
cGVyIFNCSSB2MC4zIHNwZWNpZmljYXRpb24sCj4gKyAgICAgICAgICAgICAgICAqICAtLSB0aGUg
dXBwZXIgMTYgYml0cyBtdXN0IGJlIHVudXNlZCBmb3IgYSBoYXJkd2FyZSByYXcgZXZlbnQuCj4g
KyAgICAgICAgICAgICAgICAqIEFzIHBlciBTQkkgdjMuMCBzcGVjaWZpY2F0aW9uLAoKVGhlIHRl
eHQgaGVyZSBzaG91bGQgYmUgIkFzLXBlciBTQkkgdjIuMCAuLi4iCgo+ICsgICAgICAgICAgICAg
ICAgKiAgLS0gdGhlIHVwcGVyIDggYml0cyBtdXN0IGJlIHVudXNlZCBmb3IgYSBoYXJkd2FyZSBy
YXcgZXZlbnQuCj4gICAgICAgICAgICAgICAgICAqIEJpdHMgNjM6NjIgYXJlIHVzZWQgdG8gZGlz
dGluZ3Vpc2ggYmV0d2VlbiByYXcgZXZlbnRzCj4gICAgICAgICAgICAgICAgICAqIDAwIC0gSGFy
ZHdhcmUgcmF3IGV2ZW50Cj4gICAgICAgICAgICAgICAgICAqIDEwIC0gU0JJIGZpcm13YXJlIGV2
ZW50cwo+IEBAIC01MzcsOCArNTM5LDE0IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9ldmVudF9tYXAo
c3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1NjQgKmVjb25maWcpCj4KPiAgICAgICAgICAgICAg
ICAgc3dpdGNoIChjb25maWcgPj4gNjIpIHsKPiAgICAgICAgICAgICAgICAgY2FzZSAwOgo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChzYmlfdjNfYXZhaWxhYmxlKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyogUmV0dXJuIGVycm9yIGFueSBiaXRzIFs1Ni02M10gaXMgc2V0ICBh
cyBpdCBpcyBub3QgYWxsb3dlZCBieSB0aGUgc3BlYyAqLwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKCEoY29uZmlnICYgflJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfTUFTSykp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmVjb25maWcgPSBj
b25maWcgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX1YyX01BU0s7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJfSURYOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIFJldHVybiBlcnJvciBhbnkgYml0cyBbNDgtNjNdIGlzIHNldCAgYXMgaXQgaXMgbm90
IGFsbG93ZWQgYnkgdGhlIHNwZWMgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAoIShj
b25maWcgJiB+UklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLKSkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIH0gZWxzZSBpZiAoIShjb25maWcgJiB+UklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLKSkg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmVjb25maWcgPSBjb25maWcgJiBS
SVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4KPiAtLQo+IDIuNDMuMAo+CgpPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywK
QW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
