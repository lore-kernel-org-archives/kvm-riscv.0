Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E41E7717D
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvQNL/Shp4GypGaRlwVZYitWkglN1Z6rrdf4COTMyyc=; b=DsQj025SSMt1ZM
	gElc0Rrlegl8+qKPcGj+6UkEFO+BvYQ7TS8g8J5Gwc7AjLm8dBd0gPquHYDPbzn3/vV+Gof04JCOT
	LcUOhaN1BKm9P97H5NpyPKjQhsbAIDQqq4zdR4D6b7QyGgAbgB7Wj6yBE0s/6H9DNeI/CUSxUgicU
	iTrxCzFPXvAnFcU0iQNyvX5z4KavIyHPEwhXas49grEHFGH7XRRyNmo0716c+aWBw1J9hd86cOZbS
	GactQWpRkFDqiT4CkNTrn2HpzLEW23gB7EDLJ6pD/8nxzGtE6LRPyfOQ+e9cfNYZnpqLFputQr+7j
	crS2BiVyHSqQ7OOVu15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKism-00000008vll-2jd8;
	Mon, 09 Dec 2024 18:53:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKirn-00000008ve9-09q4
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 18:52:24 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725ee27e905so1423091b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 09 Dec 2024 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733770342; x=1734375142; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE5tXM4ceddZHK4DLvqd5OPVdW2n99/09qTSZ4lNDtc=;
        b=tM5fo9ZbdJFANCbOpStCfUJ4+MDz+ZXxRsOezJGozSraLqn6/gSeOhiiuGqt0sP5kn
         7Tj3TwmGsbCX/RFrpQm5hxTALceIWU6VqOCNIsokb8jMGv4FHybZCcFkvIcwOTMVwNlY
         V3lSY6i0hzqh8O51jCK6oMy1nfcsQH3iJKvhBgktfkpZxT0O4/kGwSxtwcivoILgX9pr
         Q1M6B1P+pHA+rZiewyyetC8MzDoOvt2S8t1S6KO/9FGuLWZU03EVDKtimULQgthJb6iC
         Hgd/Z3oR7LSYjEZs0We3fblVRZyoU48LJNGmArF/rrOQmBVxutPoJWOfpcOD6L1MWWbx
         cgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733770342; x=1734375142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE5tXM4ceddZHK4DLvqd5OPVdW2n99/09qTSZ4lNDtc=;
        b=fQlxYcTEGftTy4bfjbirT+e/AocPOPsX37Ja81XQbeQaZyvZaQS/SMYDmMDujKksRz
         L/z05V+Z0XiYsHyCqKMbOfoRizoVnSKpeZV1kzYQ16zMzbV4FM8LVqZknu9z+dZMAbuY
         1mHCKb1cLOMnaZBiQ0MhJNanOT1gDwvC0TuZ/hVFNUrUrAHiL+p1SIUkdZq8GXPFFAPO
         +Em4yjmz2iLJeejAcbLSNCc5aUC7komYPZ2I1vhZTrvk4cOnYqYYZnqEXdiYJpJiSz49
         JIohL3aeRWLCYNL7UiMQsJ9irzAwcXjrOFXVUkL/Zp1ZR+a+1Z4Tsf+Nr2DZgvlc6Zhm
         Co9w==
X-Forwarded-Encrypted: i=1; AJvYcCX+Ts+UEjqdeNwJhjNW+dcPrdEbQJA2v4/9lHRuw7TnIt1ItOaoInYgAiST9R5+/cE1+oC4PG+mCM8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0mrbRKYnIOhLETsMRtA5w1eMbVv6IdDcgMq4zowy5BjoROeXp
	yJVgCclzPh6n/RMwABsTtaZQ67IQMx31JoSVcDaBH09AGL4wkIOWQqW/s4hd/UUVO03fPc8vbsM
	Kf+wlCq+iQljjp1w+V7yM5it2ImWQWPT6Zq8u1w==
X-Gm-Gg: ASbGncvubiKEqZlONeTA8xIE1epkUxipCkZnhTkRjNjFj2HTEEmhpx+SRBE80Tf4wir
	PleA2Ml2uT7MTX5dY3xMW5YH1LOVBQmJJRA==
X-Google-Smtp-Source: AGHT+IE3NlpgFvVBKio4rCWUgc2OgxnpAocEZrxQPQ/mMBSJUxJJVDkYqliqfqvlAJcB016TmpcY1ruHhQTOFNKl1H8=
X-Received: by 2002:a05:6a21:78a6:b0:1e1:adcd:eaf8 with SMTP id
 adf61e73a8af0-1e1adcdf090mr4266443637.28.1733770337025; Mon, 09 Dec 2024
 10:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com> <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
 <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com> <b48c4319-1fbc-4703-88d2-6f495af9c24e@sifive.com>
In-Reply-To: <b48c4319-1fbc-4703-88d2-6f495af9c24e@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Dec 2024 10:52:06 -0800
Message-ID: <CAHBxVyFrsF0jwwFwKsg_6=c5ewFZG12iz3owzHEv6GxpA+hB1w@mail.gmail.com>
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105223_069186_C72021D8 
X-CRM114-Status: GOOD (  27.36  )
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

T24gTW9uLCBEZWMgMiwgMjAyNCBhdCA2OjM54oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQXRpc2gsCj4KPiBPbiAyMDI0LTEyLTAy
IDY6MTUgUE0sIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3RlOgo+ID4gT24gTW9uLCBEZWMgMiwgMjAy
NCBhdCAyOjM34oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+
IHdyb3RlOgo+ID4+IE9uIDIwMjQtMTEtMTkgMjoyOSBQTSwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4g
Pj4+IFNCSSB2My4wIGludHJvZHVjZWQgYSBuZXcgcmF3IGV2ZW50IHR5cGUgdGhhdCBhbGxvd3Mg
d2lkZXIKPiA+Pj4gbWhwbWV2ZW50WCB3aWR0aCB0byBiZSBwcm9ncmFtbWVkIHZpYSBDRkdfTUFU
Q0guCj4gPj4+Cj4gPj4+IFVzZSB0aGUgcmF3IGV2ZW50IHYyIGlmIFNCSSB2My4wIGlzIGF2YWls
YWJsZS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8
ICA0ICsrKysKPiA+Pj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAxOCArKysrKysr
KysrKystLS0tLS0KPiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPj4+IGluZGV4IDliZTM4
YjA1ZjRhZC4uM2VlOWJmYTVlNzdjIDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NiaS5oCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+
Pj4gQEAgLTE1OSw3ICsxNTksMTAgQEAgc3RydWN0IHJpc2N2X3BtdV9zbmFwc2hvdF9kYXRhIHsK
PiA+Pj4KPiA+Pj4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLIEdFTk1BU0tfVUxM
KDQ3LCAwKQo+ID4+PiAgI2RlZmluZSBSSVNDVl9QTVVfUExBVF9GV19FVkVOVF9NQVNLIEdFTk1B
U0tfVUxMKDYxLCAwKQo+ID4+PiArLyogU0JJIHYzLjAgYWxsb3dzIGV4dGVuZGVkIGhwbWV2ZW50
WCB3aWR0aCB2YWx1ZSAqLwo+ID4+PiArI2RlZmluZSBSSVNDVl9QTVVfUkFXX0VWRU5UX1YyX01B
U0sgR0VOTUFTS19VTEwoNTUsIDApCj4gPj4+ICAjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRf
SURYIDB4MjAwMDAKPiA+Pj4gKyNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9WMl9JRFggMHgz
MDAwMAo+ID4+PiAgI2RlZmluZSBSSVNDVl9QTEFUX0ZXX0VWRU5UICAweEZGRkYKPiA+Pj4KPiA+
Pj4gIC8qKiBHZW5lcmFsIHBtdSBldmVudCBjb2RlcyBzcGVjaWZpZWQgaW4gU0JJIFBNVSBleHRl
bnNpb24gKi8KPiA+Pj4gQEAgLTIxNyw2ICsyMjAsNyBAQCBlbnVtIHNiaV9wbXVfZXZlbnRfdHlw
ZSB7Cj4gPj4+ICAgICAgIFNCSV9QTVVfRVZFTlRfVFlQRV9IVyA9IDB4MCwKPiA+Pj4gICAgICAg
U0JJX1BNVV9FVkVOVF9UWVBFX0NBQ0hFID0gMHgxLAo+ID4+PiAgICAgICBTQklfUE1VX0VWRU5U
X1RZUEVfUkFXID0gMHgyLAo+ID4+PiArICAgICBTQklfUE1VX0VWRU5UX1RZUEVfUkFXX1YyID0g
MHgzLAo+ID4+PiAgICAgICBTQklfUE1VX0VWRU5UX1RZUEVfRlcgPSAweGYsCj4gPj4+ICB9Owo+
ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+Pj4gaW5kZXggNTBjYmRiZjY2YmI3Li5mMGU4
NDVmZjZiNzkgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMK
PiA+Pj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4+PiBAQCAtNTksNyAr
NTksNyBAQCBhc20gdm9sYXRpbGUoQUxURVJOQVRJVkUoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4gICNkZWZpbmUgUEVSRl9FVkVOVF9GTEFHX1VTRVJf
QUNDRVNTICBCSVQoU1lTQ1RMX1VTRVJfQUNDRVNTKQo+ID4+PiAgI2RlZmluZSBQRVJGX0VWRU5U
X0ZMQUdfTEVHQUNZICAgICAgICAgICAgICAgQklUKFNZU0NUTF9MRUdBQ1kpCj4gPj4+Cj4gPj4+
IC1QTVVfRk9STUFUX0FUVFIoZXZlbnQsICJjb25maWc6MC00NyIpOwo+ID4+PiArUE1VX0ZPUk1B
VF9BVFRSKGV2ZW50LCAiY29uZmlnOjAtNTUiKTsKPiA+Pj4gIFBNVV9GT1JNQVRfQVRUUihmaXJt
d2FyZSwgImNvbmZpZzo2Mi02MyIpOwo+ID4+Pgo+ID4+PiAgc3RhdGljIGJvb2wgc2JpX3YyX2F2
YWlsYWJsZTsKPiA+Pj4gQEAgLTUyNywxOCArNTI3LDI0IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9l
dmVudF9tYXAoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1NjQgKmVjb25maWcpCj4gPj4+ICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPj4+ICAgICAgIGNhc2UgUEVSRl9UWVBFX1JBVzoKPiA+Pj4g
ICAgICAgICAgICAgICAvKgo+ID4+PiAtICAgICAgICAgICAgICAqIEFzIHBlciBTQkkgc3BlY2lm
aWNhdGlvbiwgdGhlIHVwcGVyIDE2IGJpdHMgbXVzdCBiZSB1bnVzZWQKPiA+Pj4gLSAgICAgICAg
ICAgICAgKiBmb3IgYSBoYXJkd2FyZSByYXcgZXZlbnQuCj4gPj4+ICsgICAgICAgICAgICAgICog
QXMgcGVyIFNCSSB2MC4zIHNwZWNpZmljYXRpb24sCj4gPj4+ICsgICAgICAgICAgICAgICogIC0t
IHRoZSB1cHBlciAxNiBiaXRzIG11c3QgYmUgdW51c2VkIGZvciBhIGhhcmR3YXJlIHJhdyBldmVu
dC4KPiA+Pj4gKyAgICAgICAgICAgICAgKiBBcyBwZXIgU0JJIHYzLjAgc3BlY2lmaWNhdGlvbiwK
PiA+Pj4gKyAgICAgICAgICAgICAgKiAgLS0gdGhlIHVwcGVyIDggYml0cyBtdXN0IGJlIHVudXNl
ZCBmb3IgYSBoYXJkd2FyZSByYXcgZXZlbnQuCj4gPj4+ICAgICAgICAgICAgICAgICogQml0cyA2
Mzo2MiBhcmUgdXNlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIHJhdyBldmVudHMKPiA+Pj4gICAg
ICAgICAgICAgICAgKiAwMCAtIEhhcmR3YXJlIHJhdyBldmVudAo+ID4+PiAgICAgICAgICAgICAg
ICAqIDEwIC0gU0JJIGZpcm13YXJlIGV2ZW50cwo+ID4+PiAgICAgICAgICAgICAgICAqIDExIC0g
UmlzYy1WIHBsYXRmb3JtIHNwZWNpZmljIGZpcm13YXJlIGV2ZW50Cj4gPj4+ICAgICAgICAgICAg
ICAgICovCj4gPj4+IC0KPiA+Pj4gICAgICAgICAgICAgICBzd2l0Y2ggKGNvbmZpZyA+PiA2Mikg
ewo+ID4+PiAgICAgICAgICAgICAgIGNhc2UgMDoKPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAg
IHJldCA9IFJJU0NWX1BNVV9SQVdfRVZFTlRfSURYOwo+ID4+PiAtICAgICAgICAgICAgICAgICAg
ICAgKmVjb25maWcgPSBjb25maWcgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgICBpZiAoc2JpX3YzX2F2YWlsYWJsZSkgewo+ID4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAqZWNvbmZpZyA9IGNvbmZpZyAmIFJJU0NWX1BNVV9SQVdf
RVZFTlRfVjJfTUFTSzsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
UklTQ1ZfUE1VX1JBV19FVkVOVF9WMl9JRFg7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICB9
IGVsc2Ugewo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqZWNvbmZpZyA9IGNv
bmZpZyAmIFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSzsKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0ID0gUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFg7Cj4gPj4KPiA+PiBTaG91
bGRuJ3Qgd2UgY2hlY2sgdG8gc2VlIGlmIGFueSBvZiBiaXRzIDQ4LTU1IGFyZSBzZXQgYW5kIHJl
dHVybiBhbiBlcnJvciwKPiA+PiBpbnN0ZWFkIG9mIHNpbGVudGx5IHJlcXVlc3RpbmcgdGhlIHdy
b25nIGV2ZW50Pwo+ID4+Cj4gPgo+ID4gV2UgY2FuLiBJIGRpZCBub3QgYWRkIGl0IG9yaWdpbmFs
bHkgYXMgd2UgY2FuJ3QgZG8gbXVjaCB2YWxpZGF0aW9uIGZvcgo+ID4gdGhlIHJhdyBldmVudHMg
Zm9yIGFueXdheXMuCj4gPiBJZiB0aGUgZW5jb2RpbmcgaXMgbm90IHN1cHBvcnRlZCB0aGUgdXNl
ciB3aWxsIGdldCB0aGUgZXJyb3IgYW55d2F5cwo+ID4gYXMgaXQgY2FuJ3QgZmluZCBhIGNvdW50
ZXIuCj4gPiBXZSB3aWxsIGp1c3Qgc2F2ZSAxIFNCSSBjYWxsIGlmIHRoZSBrZXJuZWwgZG9lc24n
dCBhbGxvdyByZXF1ZXN0aW5nIGFuCj4gPiBldmVudCBpZiBiaXRzIDQ4LTU1IGFyZSBzZXQuCj4K
PiBUaGUgc2NlbmFyaW8gSSdtIGNvbmNlcm5lZCBhYm91dCBpcyB3aGVyZSBtYXNraW5nIG9mZiBi
aXRzIDQ4LTU1IHJlc3VsdHMgaW4gYQo+IHZhbGlkLCBzdXBwb3J0ZWQgZW5jb2RpbmcgZm9yIGEg
ZGlmZmVyZW50IGV2ZW50LiBGb3IgZXhhbXBsZSwgaW4gdGhlIEhQTSBldmVudAo+IGVuY29kaW5n
IHNjaGVtZSB1c2VkIGJ5IFJvY2tldCBhbmQgaW5oZXJpdGVkIGJ5IFNpRml2ZSBjb3JlcywgYml0
cyA4LTU1IGFyZSBhCj4gYml0bWFwLiBTbyBtYXNraW5nIG9mZiBzb21lIG9mIHRob3NlIGJpdHMg
d2lsbCBleGNsdWRlIHNvbWUgZXZlbnRzLCBidXQgd2lsbCBub3QKPiBjcmVhdGUgYW4gaW52YWxp
ZCBlbmNvZGluZy4gVGhpcyBjb3VsZCBiZSB2ZXJ5IGNvbmZ1c2luZyBmb3IgdXNlcnMuCj4KCkFo
aCB5ZXMuIFRoYXQgaXMgcHJvYmxlbWF0aWMgaWYgdGhlIHZlbmRvciBpbXBsZW1lbnRzIHRoYXQg
dHlwZSBvZgpldmVudCBlbmNvZGluZy4KSSB3aWxsIHNlbmQgdGhlIGZpeCBwYXRjaCB3aXRoIGFu
IGVycm9yIGlmIGJpdHMgNDgtNTUgYXJlIHNldC4KCj4gUmVnYXJkcywKPiBTYW11ZWwKPgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
