Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA7EC71149
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldJGccbL6vbiV7BsH/6aM8MjtIPNfl0TrdCXapMJpF0=; b=qR+ie1CbTGv5Wq
	lSRnaoBp5nRq1lVAQlV+IedwROJNkb95l82OQFIRkiclRgv1BGHIYV36ir6XnI64lpshSs7zYmYp4
	XMfXurx6o4Wy5a96oyaPuusLDlrDGXWlSs0uMComYX0HAxOhk9ZmlzGm8cPZyfOSDXFt8XDz1BDMQ
	U7iJEWh8DHfsEeEUnP7BkzAx3VDtgXIVxLK+psym1V6zCOzC01+q/4593W4uSoi3Ro5ngACupD6wH
	PLXKmZmRGFdTJdh1PrzC37oJgjVdFxzUuxqI7eTsRJwEHyPsl5qGPFlDnMsb/2Yb4bA9T3mo/bJTO
	Gp3g9LTQrIDlH/2d7+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnoK-0000000EFf3-11L6;
	Thu, 12 Jun 2025 19:42:04 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhvP-0000000DRgZ-3N1w
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:25:01 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3ddc9872e69so3859955ab.1
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734699; x=1750339499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhSPjmAyA8pIxhMtvIKhAFsTVRGm0gzw/fSyIMnZboY=;
        b=T0HpziFC5wDtkzOF3IBsCSrWIKEaP4+mTdMnPOwNg+Tk90WXBiZRbB2ekGf0Fti/fZ
         fa4ReOYhX1mqhoz9RjOQINKHp1LxVS9CQ/yaIxVREkjZ+3WvxH7axuOQ3jN+8hkp52RI
         vydqiIlUC1UWtnoT3I+r9aihxU0wPj5FAo7LuFQkEs8N8EFvymacyldLomBdbrMLil51
         5w7daE2QI3W/+cV0DS6+IIOAwdhV2HKyykHTCoVpZNAN8OECwgJF/L/DpiB6WxIiOrlD
         ximfuTlY6DuqnF9pbp8PNY6e/Ms0V0YP7rVmb4JGNU6PmxXgaXCJ2Rk/x1vDHpJni1Dt
         rpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734699; x=1750339499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhSPjmAyA8pIxhMtvIKhAFsTVRGm0gzw/fSyIMnZboY=;
        b=bkLYWQv6C2PTyWm7akHURjgg0r3pzDx1d0MMKtF8rgYgk2woxX+eMB5dZfr/ntFXM9
         Tm/PW92ocGKP9fFBoo9vwCjVuLWWQeyllmlhUwroHTGb/Tkbv16f0DZFK7JWHwyu1AFQ
         DVyzmAOcy71nxzlFd2kNO6OWd57zWJeK90Ic1QtaDQS0oQAUQm0pn71zERGFrD2H4b89
         4c+WXI65zT2aC+3XGv5KJs7+4NdUDLKubbB7qCcFhbJzK4Xt6avXdGrX819ak59LuPZG
         /2s7wcSwTabSc9rbitKQ64aLfM4JzE3MhxDbKXpN/5Qr2aB793WzVt1Z2xs9UJG/xFsk
         ciLA==
X-Forwarded-Encrypted: i=1; AJvYcCVgKDuwg0EFkYYoLGAQOgOqj3GHE6p4yoWkochwFDR2uksKmtfdYM4BIaiEoH62EzHSKuud6shG7sM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZXGEwtKhqBsIcfbU7/ckk/S+2vLrRcvDSOIo/EcEOnc4l2MJO
	wgRZDaGzP9Qe1mY4WtnXhC/6VSym1A0poAKL16sI+RgLP0VFW5ClTdHiC6tskSRvvFvSj3fXVBX
	e29vdx3lhaHUU99B+6yevYnl6IttsXY83WszfyMKGSQ==
X-Gm-Gg: ASbGncs8haHwT4mS8n2BucEyuKjbnjNK1W7mBDd0/FzjwNTb3RyB/MaaJ0yMLAF/HYf
	pbbjvHoZkXmjsKDOskjPEoityk0zMFc8DvMEHOHQhL+MCUJ/T7OVnUnqnayxX8rzGT9yIGuFzXu
	k9fKZJ6nvkWtRb3j8AqYQaS3lk75VZ/DHD0JsKClBpm/w0
X-Google-Smtp-Source: AGHT+IEXc2HNwR+arC4fRPEFksycFniWaNbrCQxuAysOQziE7TtUqOEu/PfXdc7DJFVevcMFaqzNNcUrtmqmcHPi7Pg=
X-Received: by 2002:a05:6e02:2611:b0:3db:86fc:d328 with SMTP id
 e9e14a558f8ab-3ddfb57a71amr32260835ab.5.1749734698811; Thu, 12 Jun 2025
 06:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-13-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-13-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:54:46 +0530
X-Gm-Features: AX0GCFtl3CrqRqD9KaNbf7iyN6PgsitR5osvCuOQHoEz6erXpTG9A6k-oITxB2E
Message-ID: <CAAhSdy0C6adKeWmFadS2qeZgJu0VWEscncu7Wti==eCzjQgSsg@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] RISC-V: KVM: add SBI extension reset callback
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062459_838619_59C09D86 
X-CRM114-Status: GOOD (  22.58  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMzo1MuKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIG9ubHkgdGhlIFNUQSBleHRlbnNp
b24gbmVlZGVkIGEgcmVzZXQgZnVuY3Rpb24gYnV0IHRoYXQncwo+IGdvaW5nIHRvIGJlIHRoZSBj
YXNlIGZvciBGV0ZUIGFzIHdlbGwuIEFkZCBhIHJlc2V0IGNhbGxiYWNrIHRoYXQgY2FuIGJlCj4g
aW1wbGVtZW50ZWQgYnkgU0JJIGV4dGVuc2lvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxh
dGlzaHBAcml2b3NpbmMuY29tPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTcKClRo
YW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAg
ICB8ICAxIC0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICAyICsr
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jICAgICAgICAgfCAgMyArKy0K
PiAgNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDBlOWMyZmFiNjM3OC4uNGZhMDJlMDgy
MTQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC00MDcsNyArNDA3LDYg
QEAgdm9pZCBfX2t2bV9yaXNjdl92Y3B1X3Bvd2VyX29uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcG93ZXJfb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsK
PiAgYm9vbCBrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4K
PiAtdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKPgo+ICAjZW5kaWYgLyogX19SSVNDVl9LVk1fSE9TVF9IX18gKi8KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBpbmRleCBiY2I5MDc1N2IxNDkuLmNiNjhi
M2E1N2M4ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Ni
aS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+IEBAIC01
Nyw2ICs1Nyw3IEBAIHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHsKPiAgICAgICAgICAq
Lwo+ICAgICAgICAgaW50ICgqaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgICAgICAg
IHZvaWQgKCpkZWluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gKyAgICAgICB2b2lkICgq
cmVzZXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gIH07Cj4KPiAgdm9pZCBrdm1fcmlzY3Zf
dmNwdV9zYmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpy
dW4pOwo+IEBAIC03OCw2ICs3OSw3IEBAIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7Cj4gIGludCBrdm1fcmlzY3ZfdmNwdV9z
YmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPiAg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICB2
b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAr
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPgo+
ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19zYmlfc3RhKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgbG9uZyByZWdfbnVtLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyAqcmVnX3ZhbCk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDIyNTk3MTdlM2I4OS4u
ZWM5ZjQ0NTQ1Y2VhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC05Niw3ICs5Niw3IEBAIHN0YXRpYyB2b2lkIGt2
bV9yaXNjdl9yZXNldF92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIHZjcHUt
PmFyY2guaGZlbmNlX3RhaWwgPSAwOwo+ICAgICAgICAgbWVtc2V0KHZjcHUtPmFyY2guaGZlbmNl
X3F1ZXVlLCAwLCBzaXplb2YodmNwdS0+YXJjaC5oZmVuY2VfcXVldWUpKTsKPgo+IC0gICAgICAg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldCh2Y3B1KTsKPiArICAgICAgIGt2bV9yaXNjdl92
Y3B1X3NiaV9yZXNldCh2Y3B1KTsKPgo+ICAgICAgICAgLyogUmVzZXQgdGhlIGd1ZXN0IENTUnMg
Zm9yIGhvdHBsdWcgdXNlY2FzZSAqLwo+ICAgICAgICAgaWYgKGxvYWRlZCkKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMK
PiBpbmRleCAzMTM5ZjE3MWMyMGYuLjUwYmUwNzliNTUyOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IEBA
IC01MzYsMyArNTM2LDI3IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIGV4dC0+ZGVpbml0KHZjcHUpOwo+ICAg
ICAgICAgfQo+ICB9Cj4gKwo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9yZXNldChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4
dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4dDsKPiArICAgICAgIGNvbnN0IHN0
cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqZW50cnk7Cj4gKyAgICAgICBjb25z
dCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+ICsgICAgICAgaW50IGlkeCwg
aTsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsgaSsr
KSB7Cj4gKyAgICAgICAgICAgICAgIGVudHJ5ID0gJnNiaV9leHRbaV07Cj4gKyAgICAgICAgICAg
ICAgIGV4dCA9IGVudHJ5LT5leHRfcHRyOwo+ICsgICAgICAgICAgICAgICBpZHggPSBlbnRyeS0+
ZXh0X2lkeDsKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChpZHggPCAwIHx8IGlkeCA+PSBBUlJB
WV9TSVpFKHNjb250ZXh0LT5leHRfc3RhdHVzKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChzY29udGV4dC0+ZXh0X3N0YXR1c1tp
ZHhdICE9IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19FTkFCTEVEIHx8Cj4gKyAgICAgICAgICAg
ICAgICAgICAhZXh0LT5yZXNldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
PiArCj4gKyAgICAgICAgICAgICAgIGV4dC0+cmVzZXQodmNwdSk7Cj4gKyAgICAgICB9Cj4gK30K
PiArCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiBpbmRleCA1ZjM1NDI3MTE0YzEuLmNjNmNiN2M4ZjBl
NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gQEAgLTE2LDcgKzE2LDcgQEAKPiAgI2luY2x1
ZGUgPGFzbS9zYmkuaD4KPiAgI2luY2x1ZGUgPGFzbS91YWNjZXNzLmg+Cj4KPiAtdm9pZCBrdm1f
cmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArc3RhdGlj
IHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gIHsKPiAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7Cj4gICAg
ICAgICB2Y3B1LT5hcmNoLnN0YS5sYXN0X3N0ZWFsID0gMDsKPiBAQCAtMTU2LDYgKzE1Niw3IEBA
IGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9zdGEgPSB7
Cj4gICAgICAgICAuZXh0aWRfZW5kID0gU0JJX0VYVF9TVEEsCj4gICAgICAgICAuaGFuZGxlciA9
IGt2bV9zYmlfZXh0X3N0YV9oYW5kbGVyLAo+ICAgICAgICAgLnByb2JlID0ga3ZtX3NiaV9leHRf
c3RhX3Byb2JlLAo+ICsgICAgICAgLnJlc2V0ID0ga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNl
dCwKPiAgfTsKPgo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19zYmlfc3RhKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKPiAtLQo+IDIuNDkuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
