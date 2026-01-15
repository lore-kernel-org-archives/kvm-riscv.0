Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA77D3CC95
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v5QFsRNsSLFUJe+NmYQLh7M9jef7CyAJqHPtRVR6qI=; b=GFNZb0PHzU/YD1
	VafKwqyz3GwkQtagDvv7OrwD93gZNSEVcM/L889SVNMwtjj1iy7KzsdRa7EXKqXTE+z1RFAywdGDi
	1REXz+gg6IGThymzpu5dnfXr1Gk6g0infNxxYUDdx3fQlwwMCo87INYPblbTsq8NTcI8/LG4Aewnh
	SZqqPwj8Cd2vGzV9N7tphKk1hcvDzQkUaXUConwlAZZCcSGJ/+L4hBVzs0l+5QUizrzXErcwBoS1N
	TC0dKWSdZLYfg2brnME0JR0PA8xy1N/Nnxz6zs7hSULp28uJdtCYnQ/WpYuX+N7Kv8Fblq//uwIhK
	ala56KJx4fEqL5sUjtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBtU-0000000BLN0-3wJD;
	Thu, 15 Jan 2026 01:11:24 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBtS-0000000BLLq-0D70
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 01:11:23 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5634feea416so335272e0c.2
        for <kvm-riscv@lists.infradead.org>; Wed, 14 Jan 2026 17:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768439480; x=1769044280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWEmSPSV/4aq+tGwuGvE1EWZPGM77eZ+/59U3WROy80=;
        b=Wf/A7vaWJM8HAYuoQjVdVfhmeoKcT/UcbojvZo4X68FF14Qpqk9jM3fApBIHe9S/x6
         zdoEGMP4eg/IHp/Y2vV4O2gqQYtT44EARE7rb+TXmMTW+JcJ1wNLAFmOBghISbpTkGPb
         Zp+MeBYjeyx7G5rabxi1Y9aoZHjUGyqgWlGFuAcVPB+dNiXiuCv1jXwf9HMmvCXZc5x5
         vFDMU6BlHLruN2fOqQ03M6jF3MzWjddWAAqw+cV5W9hsBld+qTdt2MFf3fLUffZcYKRd
         mmVKgZ/BWi4durXb4gV/JyXcWlZWvYvOjPwJ99fY+VyOSND5jXlCCqotFHCBiXpdIkw4
         Y8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768439480; x=1769044280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWEmSPSV/4aq+tGwuGvE1EWZPGM77eZ+/59U3WROy80=;
        b=vbw+LSZdIrLx/pZwaPO/QtFu/WE6N1LKd1B5pg8fHmPNf29E0K5unIir6+jRX4+eyq
         wrION2R/Sa3DfZqn+PlMtY1Yeo1/0fOosuHn+O8vyNHW0B5O0/FofdSVfsujLOmIVJ1k
         t2ffpuFSEcXoxxxR8TRn8NAmsvfslQcwDoOO7PO9o9lyL01kzH9p2vJLc4wvr0LOjZaK
         rPw4JmwNLQeFs/WFjncJkAzD2yzItLfIs8H1tmEOrX5V8onnKU2B8byKyZJ/qGIN5krg
         X7q+hYajk1txuZ8VScMMN+4enVkk3UF2s8/QOUphP3lxk0Z/i1DvUkEsG625WXT20rQT
         FD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi4Mtim7pIpwL088++OO/iQfXp9HhBo/GUra+QviHM4BYkwr9oWu3MFk7cECwmjYP+Ta0Ms2wJIac=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3u79NFNqr4JpodCCJbZt0a6yoS5hUQbxJo2POfSinTc3HQiy
	IH2GfgYsv+d7PwKEP52VnSqZG3/jdfKggIrxeiDVCWa+eE2wu2DGZxgF9icj8P6wXKHSpaE5Un6
	8d6exoe2F102Pfuhp7FtvEjRDPUmpo7Q=
X-Gm-Gg: AY/fxX5mZGugWucuxjQcGJSM697qaQoJ74AdX64iGLTTAnfQW8aNLQH68iAJUQIgLu/
	ommQ1G0etOaEb46ghayzHFHbOyTaRtmJnHE1Py8PqUXjNOw984APx0xS0dUZs511yvQcFO0n6CW
	IOCYocKVBzT1BggIRhc2ePN2bA2FtZ6kQx73ysnaqjC/SSuM4jiB6MpmdvJdDnfwZvUiJEilFZE
	ByQWFHrDdvAnmOjdnrZfki7KfGatqy6trZOX6YTdCmGXOZLi9Ah3G0AKU9Jj45M08q3rWjZwg==
X-Received: by 2002:a05:6102:26d3:b0:5db:f615:1821 with SMTP id
 ada2fe7eead31-5f1838c16bamr1746719137.10.1768439478555; Wed, 14 Jan 2026
 17:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <10a102b9-1dd1-c5ca-66e4-f02794a84a93@kernel.org>
In-Reply-To: <10a102b9-1dd1-c5ca-66e4-f02794a84a93@kernel.org>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Thu, 15 Jan 2026 10:11:09 +0900
X-Gm-Features: AZwV_QgNY9cbiPSf-Pg_buhTiH9o3_E8wCotzHaSqbEA_BVUDA10Wv_icM50ON8
Message-ID: <CAA7_YY-3iVLzBJgntPkzMBZFe=uwQnkYUfJzW7rZ-i=Rw5sUKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] riscv: fix timer update hazards on RV32
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_171122_082413_6C116567 
X-CRM114-Status: GOOD (  14.23  )
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

VGhhbmsgeW91IHZlcnkgbXVjaCwgUGF1bC4KSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHF1aWNr
IGhhbmRsaW5nLgoKTmFvaGlrbwoKT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgOTozOeKAr0FNIFBh
dWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgNCBKYW4gMjAy
NiwgTmFvaGlrbyBTaGltaXp1IHdyb3RlOgo+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBmaXhlcyB0
aW1lciByZWdpc3RlciB1cGRhdGUgaGF6YXJkcyBvbiBSVjMyIGZvcgo+ID4gY2xvY2tzb3VyY2Us
IEtWTSwgYW5kIHN1c3BlbmQvcmVzdW1lIHBhdGhzIGJ5IGFkb3B0aW5nIHRoZSAzLXN0ZXAKPiA+
IHVwZGF0ZSBzZXF1ZW5jZSByZWNvbW1lbmRlZCBieSB0aGUgUklTQy1WIFByaXZpbGVnZWQgU3Bl
Y2lmaWNhdGlvbi4KPiA+Cj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBEcm9wcGVkIHJlZHVuZGFu
dCBzdWJqZWN0IGxpbmUgZnJvbSBjb21taXQgZGVzY3JpcHRpb25zLgo+ID4gLSBBZGRlZCBGaXhl
cyB0YWdzIGZvciBhbGwgcGF0Y2hlcy4KPiA+IC0gTW92ZWQgU2lnbmVkLW9mZi1ieSB0YWdzIHRv
IHRoZSBlbmQgb2YgY29tbWl0IG1lc3NhZ2VzLgo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAt
IEFkZGVkIGRldGFpbGVkIGFyY2hpdGVjdHVyYWwgYmFja2dyb3VuZCB0byBjb21taXQgbWVzc2Fn
ZXMuCj4gPiAtIEFkZGVkIEtWTSBhbmQgc3VzcGVuZC9yZXN1bWUgY2FzZXMuCj4gPgo+ID4gTmFv
aGlrbyBTaGltaXp1ICgzKToKPiA+ICAgcmlzY3Y6IGNsb2Nrc291cmNlOiBGaXggc3RpbWVjbXAg
dXBkYXRlIGhhemFyZCBvbiBSVjMyCj4gPiAgIHJpc2N2OiBrdm06IEZpeCB2c3RpbWVjbXAgdXBk
YXRlIGhhemFyZCBvbiBSVjMyCj4gPiAgIHJpc2N2OiBzdXNwZW5kOiBGaXggc3RpbWVjbXAgdXBk
YXRlIGhhemFyZCBvbiBSVjMyCj4gPgo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyAg
ICAgICB8IDMgKystCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jICAgICAgIHwgNiAr
KysrLS0KPiA+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gVGhh
bmtzLCBxdWV1ZWQgZm9yIHY2LjE5LXJjLgo+Cj4KPiAtIFBhdWwKCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
