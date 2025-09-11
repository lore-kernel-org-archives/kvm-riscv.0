Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8572CAC587
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgwLhzVuS+5812fp4fh5Snn46rv7OAxpgwDiZK8VpqU=; b=cPLMWke3lBS4WN
	uvqSp+1+QVUQMeRL/kbyuzBvMQbs/JfKd4a+zrxPKR3C37haKyHikZuVy5MotmEnMyyFhTKR8tlvF
	Jvi2RyPjNEckj5cWU9IoE53lz/CX4pRF71sPEx5U4bfRC/B8x/CN3wzskDcS/A4n8pzcZL5V0F+kg
	VpRD0fM5NT0xTDTPzqpUbF4NL6QM5gvExBKuAiQ9Co0t8PnN/GmjT1C9x7vnRgQUnOuXxciHqF+Pn
	/eE5BsoEMjZEtRpgMTA4zjQtBfPzvpUeLW8yFTPMZzZY5SGRnCM+GXEyYafVdxqR9hteRdv24Vh7O
	KnkiftgxaHIlHUZHVZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhHm-00000003DSK-2Ci2;
	Thu, 11 Sep 2025 13:24:26 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhHi-00000003DNu-18LP
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 13:24:24 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-322695f899aso528132fac.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Sep 2025 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757597057; x=1758201857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfBLhNXXq9Rsc8Z2YKn++Jo2sHEm+zyXMU4WnJYLHBc=;
        b=OyQc64tBgXrFyHLKfWFujSDq87z9Mrv0OeaBFYPQTzAYV+ubk/SRWbmGOsakHGb0vH
         ZVlhpuTA4LYc23kR3txIAzdSoe52SuHGvMBWaaEiVk2qnuKMgFvEqm2wTQRo3jlng3At
         lPRIEaa5ZlqAwT7W9+24QI8yKbxMvXdpwO/eMyi6bi9QFDms1phM5tp2q8n/5v5jL/70
         b4cjaLCKa+6L3RqYdiKOImN62HB+88Vt1C2bTNnpCOtuMhPLifER+3d2RI7tO80nj298
         olSkcnGjDhmzcLYlgAWpxPlUXNcv1adoshgCxWvHtrMtCaW3pHlz0xy+6ga6CoVuveS1
         IeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597057; x=1758201857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfBLhNXXq9Rsc8Z2YKn++Jo2sHEm+zyXMU4WnJYLHBc=;
        b=qe48l0ikrnzeLlUOG1n6MuStEaXR102ETvUEG/POdl5jQ2x7cmH7Xa0u3AdsdElcT8
         0iNqyzHj+6TD7BYCA9oH79bG86a1zVk8l2n7YEfuF92Dir87wK/yO64jaQhzokiC5Au9
         eMGkBGvSpQJg6kb4f4JMii7lJXBXQThcD5f7gVQ2VXXRsKVFYHYIn/7fmVhqu7uDhgYf
         cnoLO91ouAX1J9C61LRYS9exoxVrZE9ZjwIAoZfahFkq0Kz9c/Oz79dhoIQeoPBYXB46
         5vrHmpFI9Sxz7jnw1Ryl8+uuDeHPhs1XX720AkEHaPDYeW62BrzFcw6pJjaCJOK4BFgM
         5aBw==
X-Forwarded-Encrypted: i=1; AJvYcCWWIv3eOzpgRfTxe3sLtxhj32Y++A1G2pVjkAwa/vcDrCYoac+2iPw041ZkpOiLhP/2ZpDDarIYMs0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIf1d/I/F8akHhJYQHtUY9eXCMJmOaQC0pRipPxXP4AQN8jF2P
	8EHZFNyXR77WeEsoLYgTqCxXERhapQwsc9FC9LbIEk1Z163+3EPevvHCZo0MIcqvF2QGS6E2oQQ
	JPno7aXtgdm6ELw8+hpLAOZySw58OxDY34UIQSt5iMw==
X-Gm-Gg: ASbGncsqgUFzG6m3Un7lFx4b58jUA0bTcOVvQez2Q1ATiC5msS+vsGRWVrLPj8a2h3s
	O15iJj1ReGW24CUwSAQknmeB5Q1oWAuiVyp+o+Js9XKQjeHkO6Te9Cn/4gRu/RBwtNcbnxygZO4
	epbNNa3smuJQ0P1dgYKjWzo+t923LVl2Suc51OogSJTbO7QIfCKlr9aruOB8UN1w/6hfiYApWfm
	wCTDHCZ+eR9w0ow
X-Google-Smtp-Source: AGHT+IHRdBKXm1Bz1NHFHe2IrSKtcJoxyFdHCG+gmrlFxehDwahE40seZUC2QEjKPDn+5kw4bLLqvWTXBPHddQo3Z4w=
X-Received: by 2002:a05:6870:4e8c:b0:31d:63f9:b247 with SMTP id
 586e51a60fabf-32264607e14mr11225562fac.25.1757597056938; Thu, 11 Sep 2025
 06:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com> <20250327-counter_delegation-v5-18-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-18-1ee538468d1b@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 11 Sep 2025 21:24:04 +0800
X-Gm-Features: Ac12FXwLi65vQtG3EKjaprZe3vR6jcXi2qMAlWPQLWbqK3WvwYrKsOxiKlH-8R4
Message-ID: <CAEEQ3wk92bmHQb=EbM-Ev0ra=eS-ZH6_aGTqAw1WENXpORXUKg@mail.gmail.com>
Subject: Re: [External] [PATCH v5 18/21] RISC-V: perf: Add Qemu virt machine events
To: Atish Patra <atishp@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_062422_554958_1D16B486 
X-CRM114-Status: GOOD (  16.78  )
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

SGkgQXRpc2gsCgpPbiBGcmksIE1hciAyOCwgMjAyNSBhdCAzOjQ24oCvQU0gQXRpc2ggUGF0cmEg
PGF0aXNocEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gUWVtdSB2aXJ0IG1hY2hpbmUgc3VwcG9y
dHMgYSB2ZXJ5IG1pbmltYWwgc2V0IG9mIGxlZ2FjeSBwZXJmIGV2ZW50cy4KPiBBZGQgdGhlbSB0
byB0aGUgdmVuZG9yIHRhYmxlIHNvIHRoYXQgdXNlcnMgY2FuIHVzZSB0aGVtIHdoZW4KPiBjb3Vu
dGVyIGRlbGVnYXRpb24gaXMgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJh
IDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zl
bmRvcmlkX2xpc3QuaCB8ICA0ICsrKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9kZXYuYyAg
ICAgICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmVuZG9yaWRfbGlzdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5k
b3JpZF9saXN0LmgKPiBpbmRleCBhNTE1MGNkZjM0ZDguLjBlZWZjODQ0OTIzZSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcmlkX2xpc3QuaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yaWRfbGlzdC5oCj4gQEAgLTEwLDQgKzEwLDggQEAKPiAg
I2RlZmluZSBTSUZJVkVfVkVORE9SX0lEICAgICAgIDB4NDg5Cj4gICNkZWZpbmUgVEhFQURfVkVO
RE9SX0lEICAgICAgICAgICAgICAgIDB4NWI3Cj4KPiArI2RlZmluZSBRRU1VX1ZJUlRfVkVORE9S
X0lEICAgICAgICAgICAgMHgwMDAKPiArI2RlZmluZSBRRU1VX1ZJUlRfSU1QTF9JRCAgICAgICAg
ICAgICAgMHgwMDAKPiArI2RlZmluZSBRRU1VX1ZJUlRfQVJDSF9JRCAgICAgICAgICAgICAgMHgw
MDAKPiArCj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2Rl
di5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9kZXYuYwo+IGluZGV4IDhhMDc5OTQ5ZTNhNC4u
Y2QyYWM0Y2YzNGYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfZGV2LmMK
PiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2Rldi5jCj4gQEAgLTI2LDYgKzI2LDcgQEAK
PiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4g
ICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMuaD4KPiArI2luY2x1ZGUgPGFzbS92ZW5k
b3JpZF9saXN0Lmg+Cj4gICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMvYW5kZXMuaD4K
PiAgI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ICAjaW5jbHVkZSA8YXNtL2Nzcl9pbmQuaD4KPiBA
QCAtMzkxLDcgKzM5Miw0MiBAQCBzdHJ1Y3QgcmlzY3ZfdmVuZG9yX3BtdV9ldmVudHMgewo+ICAg
ICAgICAgICAuaHdfZXZlbnRfbWFwID0gX2h3X2V2ZW50X21hcCwgLmNhY2hlX2V2ZW50X21hcCA9
IF9jYWNoZV9ldmVudF9tYXAsIFwKPiAgICAgICAgICAgLmF0dHJzX2V2ZW50cyA9IF9hdHRycyB9
LAo+Cj4gKy8qIFFFTVUgdmlydCBQTVUgZXZlbnRzICovCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
cmlzY3ZfcG11X2V2ZW50IHFlbXVfdmlydF9od19ldmVudF9tYXBbUEVSRl9DT1VOVF9IV19NQVhd
ID0gewo+ICsgICAgICAgUEVSRl9NQVBfQUxMX1VOU1VQUE9SVEVELAo+ICsgICAgICAgW1BFUkZf
Q09VTlRfSFdfQ1BVX0NZQ0xFU10gICAgICAgICAgICAgID0gezB4MDEsIDB4RkZGRkZGRjh9LAo+
ICsgICAgICAgW1BFUkZfQ09VTlRfSFdfSU5TVFJVQ1RJT05TXSAgICAgICAgICAgID0gezB4MDIs
IDB4RkZGRkZGRjh9Cj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJpc2N2X3BtdV9l
dmVudCBxZW11X3ZpcnRfY2FjaGVfZXZlbnRfbWFwW1BFUkZfQ09VTlRfSFdfQ0FDSEVfTUFYXQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtQRVJGX0NP
VU5UX0hXX0NBQ0hFX09QX01BWF0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBbUEVSRl9DT1VOVF9IV19DQUNIRV9SRVNVTFRfTUFYXSA9IHsKPiArICAg
ICAgIFBFUkZfQ0FDSEVfTUFQX0FMTF9VTlNVUFBPUlRFRCwKPiArICAgICAgIFtDKERUTEIpXVtD
KE9QX1JFQUQpXVtDKFJFU1VMVF9NSVNTKV0gICA9IHsweDEwMDE5LCAweEZGRkZGRkY4fSwKPiAr
ICAgICAgIFtDKERUTEIpXVtDKE9QX1dSSVRFKV1bQyhSRVNVTFRfTUlTUyldICA9IHsweDEwMDFC
LCAweEZGRkZGRkY4fSwKPiArCj4gKyAgICAgICBbQyhJVExCKV1bQyhPUF9SRUFEKV1bQyhSRVNV
TFRfTUlTUyldICAgPSB7MHgxMDAyMSwgMHhGRkZGRkZGOH0sCj4gK307Cj4gKwo+ICtSVlBNVV9F
VkVOVF9DTUFTS19BVFRSKGN5Y2xlcywgY3ljbGVzLCAweDAxLCAweEZGRkZGRkY4KTsKPiArUlZQ
TVVfRVZFTlRfQ01BU0tfQVRUUihpbnN0cnVjdGlvbnMsIGluc3RydWN0aW9ucywgMHgwMiwgMHhG
RkZGRkZGOCk7Cj4gK1JWUE1VX0VWRU5UX0NNQVNLX0FUVFIoZFRMQi1sb2FkLW1pc3NlcywgZFRM
Ql9sb2FkX21pc3MsIDB4MTAwMTksIDB4RkZGRkZGRjgpOwo+ICtSVlBNVV9FVkVOVF9DTUFTS19B
VFRSKGRUTEItc3RvcmUtbWlzc2VzLCBkVExCX3N0b3JlX21pc3MsIDB4MTAwMUIsIDB4RkZGRkZG
RjgpOwo+ICtSVlBNVV9FVkVOVF9DTUFTS19BVFRSKGlUTEItbG9hZC1taXNzZXMsIGlUTEJfbG9h
ZF9taXNzLCAweDEwMDIxLCAweEZGRkZGRkY4KTsKCklmIG90aGVyIHZlbmRvcnMgaW50ZW5kIHRv
IGRlZmluZSBpdCwgd291bGQgdGhhdCB0aHJvdyBhIGR1cGxpY2F0ZQpkZWZpbml0aW9uIGVycm9y
PwoKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpxZW11X3ZpcnRfZXZlbnRfZ3JvdXBb
XSA9IHsKPiArICAgICAgIFJWUE1VX0VWRU5UX0FUVFJfUFRSKGN5Y2xlcyksCj4gKyAgICAgICBS
VlBNVV9FVkVOVF9BVFRSX1BUUihpbnN0cnVjdGlvbnMpLAo+ICsgICAgICAgUlZQTVVfRVZFTlRf
QVRUUl9QVFIoZFRMQl9sb2FkX21pc3MpLAo+ICsgICAgICAgUlZQTVVfRVZFTlRfQVRUUl9QVFIo
ZFRMQl9zdG9yZV9taXNzKSwKPiArICAgICAgIFJWUE1VX0VWRU5UX0FUVFJfUFRSKGlUTEJfbG9h
ZF9taXNzKSwKPiArICAgICAgIE5VTEwsCj4gK307Cj4gKwo+ICBzdGF0aWMgc3RydWN0IHJpc2N2
X3ZlbmRvcl9wbXVfZXZlbnRzIHBtdV92ZW5kb3JfZXZlbnRzX3RhYmxlW10gPSB7Cj4gKyAgICAg
ICBSSVNDVl9WRU5ET1JfUE1VX0VWRU5UUyhRRU1VX1ZJUlRfVkVORE9SX0lELCBRRU1VX1ZJUlRf
QVJDSF9JRCwgUUVNVV9WSVJUX0lNUExfSUQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBxZW11X3ZpcnRfaHdfZXZlbnRfbWFwLCBxZW11X3ZpcnRfY2FjaGVfZXZlbnRfbWFwLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcWVtdV92aXJ0X2V2ZW50X2dyb3VwKQo+
ICB9Owo+Cj4gIGNvbnN0IHN0cnVjdCByaXNjdl9wbXVfZXZlbnQgKmN1cnJlbnRfcG11X2h3X2V2
ZW50X21hcDsKPgo+IC0tCj4gMi40My4wCj4KPgoKVGhhbmtzLApZdW5odWkKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
