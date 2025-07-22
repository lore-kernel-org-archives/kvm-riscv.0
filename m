Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57382C83F27
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u12J9VQnuHXfg64mIRH9+Lsmui5wWoIxsSCAfzP3EXI=; b=XQ6teUzCKslxPE
	A63LKVCOnOObiKX+7d1HmCNJSzTrgiCzMMGmjW8KGAE1a4dfUY4OBmu7S9Je9Wu+D37z++eon+XcX
	mVoyvWtFwUE8LgJTVSQ3IQB+2y65HxMY+MT7M9zwBzZwVCPxsLvt70vMzstctUGgycQNs1AEq+BpE
	LEPzX4GlrwxnPrO+TZwi0YOlSTa+CZR/EUpnCYAfhR3HufkAN1zKdgquMd3k3YlDw3LwhYcR2klfw
	op0Jzk+NqwTvGDWuvB32/cN+2oW2MoZgRt+mG274IPDrvlRQzJnhWqeSGjM6QZivyNOboPqy6hG+2
	Q31d+8ztI+geEsZlx3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue46P-00000001DRl-09FV;
	Tue, 22 Jul 2025 03:55:41 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue46M-00000001DQY-13t2
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:55:39 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e29ee0faf3so10738105ab.2
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753156537; x=1753761337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTiIswXCUeRqcifdr1qmaG/ebZiMNguVP5JbzVmVURc=;
        b=pq94xI0C417XGos3hoJ0kQuirqknCk5/9Dir67Pf8rGPFOHVXWNWQc72Ecw0ogn43z
         JHFs9FhdUXfTJoWWGRjJk1R/rSgLkLZhSqH/wwr5umn/u7Q6KYvL+jZB9gCq7dz5n3Mv
         m9ROYysPvVSyWzClQobk2oPFgdyMFLTNuvViYYRM/VsNoIBnLu84irnJSwUSLhbwwlhY
         kITJcv8P7uL7UROGdyMmCnaSNTaVzXBsjA3aj+eh/8kfiSIabZza69s6eL6zlqUp6RjK
         oxeOEQgGeeo0V6ZfbtdIwkqof+WhXTpG0JsnBCD0+wqbRqICfnmy/ADIywmhGT0xG3bQ
         1j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156537; x=1753761337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTiIswXCUeRqcifdr1qmaG/ebZiMNguVP5JbzVmVURc=;
        b=BJKB7acKc7BKirCcBd2qIUGE0qmaIpPNcoJOatCCha9SrnUlPVDmW0dL2TbVvzQRKS
         1oKRJlcH9vLMHb5NYCvGy9axOIX4ghrtT0gtE29QV2kLeoF6o0wwQakRhJ98V9r9A0t8
         gaT8NtLBJoUN4JEWW+wNSmaEW8Rvp+gJnP4k8lEJdWxh27Ba7exXkl7DDm13WYqBHIbl
         9/oyOkxCsOVrgXIEfMgbDOYEjcPmVZ+WExcUT7mgNDUCcfaczksnD1FC8n+AJAJhMa4G
         AusDOE5wentz5Vrv2mgtM2yeTLGd5KzXmU8UWJ8Zz+Jd4OwOtGEv4BGjuYI2m1aRbcPZ
         uOxg==
X-Forwarded-Encrypted: i=1; AJvYcCWt1i52kVxOVasqTa27xCLVU1j/WO+l5yfHdVOXkDk+OPxCQd7sfgemJ4OlR/9ZZOn9ZEv9FV7RZZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsKuE6+umZ5LzPOWNOCWl15LQEnpocYxAYlCiPKKj5Nw3kLDs5
	G8QDwy7mb7G0aH9ykq7qu8ivf5FlQnRvMymDcRTtRoDycZhV6d14dIm65Wn5Dw9Jk0Ntwk341Yc
	6iM9t+Q14XoXzNWdC6YZ4VhTzhtVpbOhQWTrN/zvmBg==
X-Gm-Gg: ASbGnct+jo8YoAWyosSoq7UouwGBW94XnuUfLIkXcUED6coYHC27ECRgpMDG3HRq0V9
	1WLlCLc5ircKYjruk85o6Ebdrx/FA3z9okcZzU/Wh4tXWykocD/dDcYvDHa7MCeFE6JGNemsRg6
	vZklm3ZWzWIog4PxWwXc1AibVnb29PovjYdp1oT7NQ9+1Ps2DW5E8G5RynbY6WGBJQu0tMBb41S
	EZem30W
X-Google-Smtp-Source: AGHT+IEOqS8YGgVoprY+8f3pC+3mkVKAq8JUCoZfCHkL1OAyGAf9GO3LLl24tZ/Rk5tS5g9YXKMA+WXBYy2KvEy5e+c=
X-Received: by 2002:a05:6e02:3b85:b0:3e2:a868:8bfc with SMTP id
 e9e14a558f8ab-3e2a8689009mr128348475ab.17.1753156537299; Mon, 21 Jul 2025
 20:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com> <20250721-pmu_event_info-v4-4-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-4-ac76758a4269@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 09:25:26 +0530
X-Gm-Features: Ac12FXwLvJgSGjfrNWw90BLHUksAPu_rJedadgUcf1wkEVZ7pdyL3Xk4uR_QcQg
Message-ID: <CAAhSdy1KHTW4J+OKVgBof2gQDfFuKq0H9rrmsJ7L2KBRXtzuaw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_205538_404833_9B5C6644 
X-CRM114-Status: GOOD (  22.97  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgODo0NeKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFdpdGggdGhlIG5ldyBTQkkgUE1VIGV2ZW50IGluZm8gZnVu
Y3Rpb24sIHdlIGNhbiBxdWVyeSB0aGUgYXZhaWxhYmlsaXR5Cj4gb2YgdGhlIGFsbCBzdGFuZGFy
ZCBTQkkgUE1VIGV2ZW50cyBhdCBib290IHRpbWUgd2l0aCBhIHNpbmdsZSBlY2FsbC4KPiBUaGlz
IGltcHJvdmVzIHRoZSBib290aW1lIGJ5IGF2b2lkaW5nIG1ha2luZyBhbiBTQkkgY2FsbCBmb3Ig
ZWFjaAo+IHN0YW5kYXJkIFBNVSBldmVudC4gU2luY2UgdGhpcyBmdW5jdGlvbiBpcyBkZWZpbmVk
IG9ubHkgaW4gU0JJIHYzLjAsCj4gaW52b2tlIHRoaXMgb25seSBpZiB0aGUgdW5kZXJseWluZyBT
QkkgaW1wbGVtZW50YXRpb24gaXMgdjMuMCBvciBoaWdoZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAgOSArKysrKysKPiAgZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCj4gaW5kZXggYjBjNDFlZjU2OTY4Li41Y2E3Y2ViYzEzY2MgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKPiBAQCAtMTM2LDYgKzEzNiw3IEBAIGVudW0gc2JpX2V4dF9wbXVfZmlkIHsKPiAg
ICAgICAgIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiAgICAgICAgIFNCSV9FWFRfUE1V
X0NPVU5URVJfRldfUkVBRF9ISSwKPiAgICAgICAgIFNCSV9FWFRfUE1VX1NOQVBTSE9UX1NFVF9T
SE1FTSwKPiArICAgICAgIFNCSV9FWFRfUE1VX0VWRU5UX0dFVF9JTkZPLAo+ICB9Owo+Cj4gIHVu
aW9uIHNiaV9wbXVfY3RyX2luZm8gewo+IEBAIC0xNTksNiArMTYwLDE0IEBAIHN0cnVjdCByaXNj
dl9wbXVfc25hcHNob3RfZGF0YSB7Cj4gICAgICAgICB1NjQgcmVzZXJ2ZWRbNDQ3XTsKPiAgfTsK
Pgo+ICtzdHJ1Y3QgcmlzY3ZfcG11X2V2ZW50X2luZm8gewo+ICsgICAgICAgdTMyIGV2ZW50X2lk
eDsKPiArICAgICAgIHUzMiBvdXRwdXQ7Cj4gKyAgICAgICB1NjQgZXZlbnRfZGF0YTsKPiArfTsK
PiArCj4gKyNkZWZpbmUgUklTQ1ZfUE1VX0VWRU5UX0lORk9fT1VUUFVUX01BU0sgMHgwMQo+ICsK
PiAgI2RlZmluZSBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0sgR0VOTUFTS19VTEwoNDcsIDApCj4g
ICNkZWZpbmUgUklTQ1ZfUE1VX1BMQVRfRldfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg2MSwgMCkK
PiAgLyogU0JJIHYzLjAgYWxsb3dzIGV4dGVuZGVkIGhwbWV2ZW50WCB3aWR0aCB2YWx1ZSAqLwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IDczMzE4MDhiMTE5Mi4uNDMzZDEyMmYxZjQxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTI5OSw2ICsyOTksNjYgQEAgc3RhdGljIHN0cnVjdCBz
YmlfcG11X2V2ZW50X2RhdGEgcG11X2NhY2hlX2V2ZW50X21hcFtQRVJGX0NPVU5UX0hXX0NBQ0hF
X01BWF0KPiAgICAgICAgIH0sCj4gIH07Cj4KPiArc3RhdGljIGludCBwbXVfc2JpX2NoZWNrX2V2
ZW50X2luZm8odm9pZCkKPiArewo+ICsgICAgICAgaW50IG51bV9ldmVudHMgPSBBUlJBWV9TSVpF
KHBtdV9od19ldmVudF9tYXApICsgUEVSRl9DT1VOVF9IV19DQUNIRV9NQVggKgo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICBQRVJGX0NPVU5UX0hXX0NBQ0hFX09QX01BWCAqIFBFUkZfQ09VTlRf
SFdfQ0FDSEVfUkVTVUxUX01BWDsKPiArICAgICAgIHN0cnVjdCByaXNjdl9wbXVfZXZlbnRfaW5m
byAqZXZlbnRfaW5mb19zaG1lbTsKPiArICAgICAgIHBoeXNfYWRkcl90IGJhc2VfYWRkcjsKPiAr
ICAgICAgIGludCBpLCBqLCBrLCByZXN1bHQgPSAwLCBjb3VudCA9IDA7Cj4gKyAgICAgICBzdHJ1
Y3Qgc2JpcmV0IHJldDsKPiArCj4gKyAgICAgICBldmVudF9pbmZvX3NobWVtID0ga2NhbGxvYyhu
dW1fZXZlbnRzLCBzaXplb2YoKmV2ZW50X2luZm9fc2htZW0pLCBHRlBfS0VSTkVMKTsKPiArICAg
ICAgIGlmICghZXZlbnRfaW5mb19zaG1lbSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50
X21hcCk7IGkrKykKPiArICAgICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5l
dmVudF9pZHggPSBwbXVfaHdfZXZlbnRfbWFwW2ldLmV2ZW50X2lkeDsKPiArCj4gKyAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfbWFwKTsgaSsrKSB7Cj4g
KyAgICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVu
dF9tYXBbaV0pOyBqKyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGsgPSAwOyBr
IDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfbWFwW2ldW2pdKTsgaysrKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5ldmVudF9p
ZHggPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcG11X2NhY2hlX2V2ZW50X21hcFtpXVtqXVtrXS5ldmVudF9pZHg7Cj4gKyAgICAgICAg
ICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICBiYXNlX2FkZHIgPSBfX3BhKGV2ZW50
X2luZm9fc2htZW0pOwo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiAr
ICAgICAgICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9F
VkVOVF9HRVRfSU5GTywgbG93ZXJfMzJfYml0cyhiYXNlX2FkZHIpLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdXBwZXJfMzJfYml0cyhiYXNlX2FkZHIpLCBjb3VudCwgMCwgMCwg
MCk7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklf
RVhUX1BNVSwgU0JJX0VYVF9QTVVfRVZFTlRfR0VUX0lORk8sIGJhc2VfYWRkciwgMCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50LCAwLCAwLCAwKTsKPiArICAgICAgIGlm
IChyZXQuZXJyb3IpIHsKPiArICAgICAgICAgICAgICAgcmVzdWx0ID0gLUVPUE5PVFNVUFA7Cj4g
KyAgICAgICAgICAgICAgIGdvdG8gZnJlZV9tZW07Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50X21hcCk7IGkrKykgewo+ICsg
ICAgICAgICAgICAgICBpZiAoIShldmVudF9pbmZvX3NobWVtW2ldLm91dHB1dCAmIFJJU0NWX1BN
VV9FVkVOVF9JTkZPX09VVFBVVF9NQVNLKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwbXVf
aHdfZXZlbnRfbWFwW2ldLmV2ZW50X2lkeCA9IC1FTk9FTlQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgY291bnQgPSBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9tYXApOwo+ICsKPiArICAgICAg
IGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXApOyBpKyspIHsK
PiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IEFSUkFZX1NJWkUocG11X2NhY2hlX2V2
ZW50X21hcFtpXSk7IGorKykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvciAoayA9IDA7
IGsgPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal0pOyBrKyspIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGV2ZW50X2luZm9fc2htZW1bY291bnRd
Lm91dHB1dCAmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9Q
TVVfRVZFTlRfSU5GT19PVVRQVVRfTUFTSykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal1ba10uZXZlbnRfaWR4ID0gLUVO
T0VOVDsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50Kys7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+
ICtmcmVlX21lbToKPiArICAgICAgIGtmcmVlKGV2ZW50X2luZm9fc2htZW0pOwo+ICsKPiArICAg
ICAgIHJldHVybiByZXN1bHQ7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHBtdV9zYmlfY2hlY2tf
ZXZlbnQoc3RydWN0IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBzYmlyZXQgcmV0Owo+IEBAIC0zMTYsNiArMzc2LDE1IEBAIHN0YXRpYyB2b2lkIHBtdV9z
YmlfY2hlY2tfZXZlbnQoc3RydWN0IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4KPiAgc3Rh
dGljIHZvaWQgcG11X3NiaV9jaGVja19zdGRfZXZlbnRzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKPiAgewo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAoc2JpX3YzX2F2YWls
YWJsZSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX2NoZWNrX2V2ZW50X2luZm8o
KTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBw
cl9lcnIoInBtdV9zYmlfY2hlY2tfZXZlbnRfaW5mbyBmYWlsZWQgd2l0aCBlcnJvciAlZFxuIiwg
cmV0KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAg
IGZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShwbXVfaHdfZXZlbnRfbWFwKTsgaSsrKQo+
ICAgICAgICAgICAgICAgICBwbXVfc2JpX2NoZWNrX2V2ZW50KCZwbXVfaHdfZXZlbnRfbWFwW2ld
KTsKPgo+Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
