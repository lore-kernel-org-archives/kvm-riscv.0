Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E28AD3F07A
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6iZgTVo7mDBvtwKl3kYcHs2qp7BQZEwbOzzL3BpNeQ=; b=gyPMR01UfVmjvq
	+YKScAsfnQzOPrQYfE7Fn4koG7XvsvjG67LOQ3tqSpsyD0hZMVch4xEAxqau1v0kKnkRuWXqa3sBs
	uXv6gsuwZGcOT5w2XinE2zMwNT0Qi8Ok4W6V/Bf1XsU/VscOMuvhsBInnlLAh+QP/BQmK+pSbgW87
	V+NhM4F5c7FlExqK04bdwAYVrwLny7qceUaHsb8Hg07511hR5z0Pw4rcSGfy9pAz8L6fB/A02wMLg
	7OSOaVQXj5xuCU/p05dod0ZzCSuAXjm3eEgbP+uI/gqPL14d8V1RJuHAQQdVEh5JDnwMc+n4tqHFf
	DkpADs5wZWps3yIxkPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AC-0000000GF9O-40RB;
	Wed, 28 Jan 2026 15:09:00 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AA-0000000GF8h-1t5H
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:09:00 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4043b27ddeaso1994509fac.1
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Jan 2026 07:08:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769612936; cv=none;
        d=google.com; s=arc-20240605;
        b=IiukwWw5GvwCy9s976iMHZKKv/eylv1LppvEj2NMQslTPA+zi97qVS/rZiWarajr98
         ofHlqXSyaGxfUQbUBe04x3Z7Y/YvtCJbRB2+F28HuBGkbAfLRmUArzAbX3KrM55BiivC
         n03NC7zzGdfSrYfz1QiLVQjujpVUss6viFX/C4ssSLwC79yWPBcpumMdKcd8cIjQfwXE
         D+oczRvDH/xc4iWFRBBDW4hRkFAmjQyAD+03Qr3DSCveJUisUVt4PDYx1IgfEUZuvMCJ
         tQAyJo90hl8DEXH2xO4maEsFMY19wcWANqwvnyPdRzI2prsW6ieQWNkoulRBa1wZ+8LQ
         +W6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AxMPzN53EYgjdk6Vy1nZn5p3hSqaa1HYt69dzR2C85k=;
        fh=/71sIIB+A6lCt0YXbZzRq4SWYcyaCB0G7EAuXWIED/w=;
        b=CHV9zU6jozzx/qQqsypckQtO20TszgmgBINQyvj70ibAtul2QGO3cNubQGGb//H10X
         ImWozNZTW9VQGWSFsbyS+aER+TlAc3H9FHIhf9yscDC8E8N+dpO6d5JWItL+8Iq8VDPW
         O/MHwALHrhSjlZ8CAmehr2uBnsUD5G1NrD5EaAXx6mOjsoZ87++odZeOjWIiegGThvLD
         4zcrpiwvFMiaZofON7ZfmZw7rm5+MQgotdaey8qA//ATJojwfBAO4gQBDq+83TzbT6/d
         htev9OD9BZyJlBUOUn/eefB3+HFZDqTG6FCZTXkPSaSQA7LSwGW/4zzSsloLvyYCB6CG
         VXQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769612936; x=1770217736; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxMPzN53EYgjdk6Vy1nZn5p3hSqaa1HYt69dzR2C85k=;
        b=fTWTcAGfJdsY1V4hPKm2t9eZNNxuO8ixk3EsnXSqJYkJb+fI1XKGtSyQauEnvvn2qn
         vBxcmiKLoyrF2I3C9u7Vv/X5VhmBXmL8KxY2YRL6GhdjWZvb5ub3L2LMlzmSP27yuvPP
         2ChWBm/cIVEGlGdM3ojVbAOFtiHgoWwVFafx9MtjqtdlQWYR7wwhgLgdLEIJTgqi4NV2
         ZoLPefvqUMW4TkQD6/p3O2Qv2zWsh7cpZsmmd8kOn0uZnm41AHvIsLrLHDOrYBugSt7A
         LZcipQoeogYE4oLqyNqiocr2bdfDdt++NUiIhJre4axtNnhuySO0R60NbjjYO5m5ATR5
         QYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612936; x=1770217736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AxMPzN53EYgjdk6Vy1nZn5p3hSqaa1HYt69dzR2C85k=;
        b=bSsrL/TDH84k6OVnB21S0f4sKBlTtTRe9RwgpNrwPOy08wLuFcDI8Mo552fd6qmhOm
         +ONrmKjSaFTQS6hDHZm6LgML8ch7ABtiW3hhQLZbnF6Q4ataDSQSBmke8iv4FXWiQXJm
         XpOVaKAJ9ZPBZzfiRBYBC4xtCjmC8HAh4Gs6PzpaZhUvT2ycEW3CwKkPURdkaWrtcuD9
         ArTmVFXQBOv8zfSpg03/6n724gTOz7NsuJEXN29/iT+6kyWgu/2+QTkgQ2p7AQroKfHs
         bGWfkWyQDKo8x8wgbhYYHsm7GT0OoBwwrA6XPO03IjHpMaCCEHeYiP0I1gr3pWu/Tv+C
         KZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqU3egNOz+PZ5j3kMSEOkobMLl/zuGZzIhfRWejREIVwdCr3QG8WoLpozFz/xCbTMOpDetNJ9QboQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbvdC4ePzviIg1NlQ1GVhkKfuhhLUrJ0oiA5RIDmdYyJ/mWvsf
	7dRUk7cfpACiKZf39Q8p4kxloNhgTEZvGUWZINXpm7NSSlqOx0jgWyShmh7sozQRGE3mEvCSbZO
	TXo0wHsORQNlMEqndSJ7r+1wxpB10sNOoXyZgr45yYQ==
X-Gm-Gg: AZuq6aLbOVPfdtcZltvxb7sBvC8abXeEycnc2T0T0yyjbwDCKPuEd36HKDZ6XUniRuc
	vjeBivw2WIxyn9w0mVpUCtpqj+csBDNDdXqxyDq31lWHkKfeotwCEu1Z/aHvgFI312qYZtFK2B4
	jXvaFdrKA9M5UBUZRPaix2l6zZHtBLLoxkaQIuCD19Svn8gvs/tZn1/WQicEyg2269rNPrfKmAM
	V8cIR2Ua+xduXF4Ofb6mwBD6sV1LtpprumMG9Ar50JvbfVJHUsXWK/tWVXuS1OElCATgpYvFMcW
	bkt+xR4NrrQkXkNLhy+0eshWeWeEExhYmqXjj7UzhYeT+ZT56s0Q/knlnAc=
X-Received: by 2002:a4a:edc5:0:b0:662:ffb2:c5eb with SMTP id
 006d021491bc7-662ffb2c7dbmr710171eaf.38.1769612936518; Wed, 28 Jan 2026
 07:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Jan 2026 20:38:45 +0530
X-Gm-Features: AZwV_QgU7EEvN2RGRe6P5jSnLHFztiDjeyvI6uk4oEgv6ph_m4-rthrrImh9DQ4
Message-ID: <CAAhSdy2z+8X3mgdfh5NOyJdJrH91honoAKzru+q8y1_D4pakRw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_070858_655992_E62E7474 
X-CRM114-Status: GOOD (  18.97  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMTI6NTLigK9QTSBKaWFrYWkgWHUgPGppYWthaXBlYW51
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbnVsbCBwb2ludGVyIGNoZWNrIGZvciBpbXNp
Y19zdGF0ZSBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdCBpbgo+IGt2bV9yaXNjdl9haWFfaW1zaWNf
cndfYXR0cigpLiBXaGlsZSB0aGUgZnVuY3Rpb24gY2hlY2tzIHRoYXQgdGhlCj4gdmNwdSBleGlz
dHMsIGl0IGRvZXNuJ3QgdmVyaWZ5IHRoYXQgdGhlIHZjcHUncyBpbXNpY19zdGF0ZSBoYXMgYmVl
bgo+IGluaXRpYWxpemVkLCBsZWFkaW5nIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIHdo
ZW4gYWNjZXNzZWQuCj4KPiBUaGUgY3Jhc2ggbWFuaWZlc3RzIGFzOgo+ICAgVW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzCj4gICBkZmZmZmZm
ZjAwMDAwMDA2Cj4gICAuLi4KPiAgIGt2bV9yaXNjdl9haWFfaW1zaWNfcndfYXR0cisweDJkOC8w
eDg1NCBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo5NTgKPiAgIGFpYV9zZXRfYXR0cisweDJl
ZS8weDE3MjYgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jOjM1NAo+ICAga3ZtX2RldmljZV9p
b2N0bF9hdHRyIHZpcnQva3ZtL2t2bV9tYWluLmM6NDc0NCBbaW5saW5lXQo+ICAga3ZtX2Rldmlj
ZV9pb2N0bCsweDI5Ni8weDM3NCB2aXJ0L2t2bS9rdm1fbWFpbi5jOjQ3NjEKPiAgIHZmc19pb2N0
bCBmcy9pb2N0bC5jOjUxIFtpbmxpbmVdCj4gICAuLi4KPgo+IFRoZSBmaXggYWRkcyBhIGNoZWNr
IHRvIHJldHVybiAtRU5PREVWIGlmIGltc2ljX3N0YXRlIGlzIE5VTEwgYW5kIG1vdmVzCj4gaXNl
bCBhc3NpZ25tZW50IGFmdGVyIGltc2ljX3N0YXRlIE5VTEwgY2hlY2suCj4KPiBGaXhlczogNTQ2
MzA5MWE1MWNmYWEgKCJSSVNDLVY6IEtWTTogRXhwb3NlIElNU0lDIHJlZ2lzdGVycyBhcyBhdHRy
aWJ1dGVzIG9mIEFJQSBpcnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlh
a2FpMjAyNUBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBl
YW51dEBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBmb3IgTGludXgtNi4yMAoKVGhhbmtzLApBbnVwCgoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBp
bmRleCBlNTk3ZTg2NDkxYzNiLi5iZDcwODFlNzAwMzZkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9pbXNpYy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBA
QCAtOTUyLDggKzk1MiwxMCBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9pbXNpY19yd19hdHRyKHN0cnVj
dCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlLAo+ICAgICAgICAgaWYgKCF2Y3B1KQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPgo+IC0gICAgICAgaXNlbCA9IEtWTV9ERVZf
UklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAgaW1zaWMgPSB2Y3B1LT5h
cmNoLmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+ICsgICAgICAgaWYgKCFpbXNpYykKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKyAgICAgICBpc2VsID0gS1ZNX0RFVl9SSVND
Vl9BSUFfSU1TSUNfR0VUX0lTRUwodHlwZSk7Cj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZl
KCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPgo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
