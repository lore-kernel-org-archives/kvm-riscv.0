Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD61CCF9F8
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XigUAxOxubd244NpbNrovy1WHQESsMxtYIzR47nL34=; b=DpDvA/yviLxR9X
	az71gwj1+pzDDOEu9aa/ZHlWXqLpZ1Fz4iHD6GpaK2m9Xf0gLbVQAbfgvnDHb7VbkFbMEw6VJwQIN
	bikC8byr7AaLV3fpDzRDK1l9J9PjPYKPY9wsVeFJd3qvvpuX540QY2CDxAobP/6ry0MF2r8NcjTAL
	7EJG+C4NlTISF/CSnkvE14eMDSp9KYDwzm6LAni4QlSigKEsMIdPvUtCaI3A7yKCcBXDxdPt+vSIT
	5Kk6CyBvc5HqtiWRSNl5b5tmGC3bfz8eWbWlfQ97jUSKQcMTV5kbVgjVWjkO9LRQ8/v+5jmbZCHcv
	B+LBOBVNODC7v3o0ebhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKGC-0000000HAAR-3k30;
	Fri, 07 Nov 2025 11:04:04 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKG9-0000000HA90-2pz2
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 11:04:03 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-9486354dcb2so24010639f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Nov 2025 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762513440; x=1763118240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5VodCG3bTal5vrS9k2SlGtZ950F4z5chIAl+OKVPjk=;
        b=T20RzsbtZ0CemKJrIozV02zn2ly8kINNPNHuqAM2HWvlA1fJS8HSMMsi+UAZscRU67
         TzIskrREOL/DorsZY/4mmMqxNOTNy2vrF1OpUVojB7h1/7iT3Qjj6DIzd/lQgWKmE6Vm
         mLNoaUhbwKh1e/ZyCrC6T0f6nDXIhduKs+oMdMfU/vHxGUgVvWRoOHvnVg/sAQfSn5Vj
         giPRnJAXPukbP+G/b4QDgkKxo0O6gkPCO6CDvbjJS3CliTV+V7YINVPGC2ObVFSGKWDx
         G1o/1rs0jGEC6v8y+G2ZIW6QJxtrI643Rp0kmeqWcEtA6EZ6PBbSkeFh2argh2Zt4HaA
         CMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513440; x=1763118240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5VodCG3bTal5vrS9k2SlGtZ950F4z5chIAl+OKVPjk=;
        b=Faovw1uCNmpqrkArMnQV/HL8rFsIOkcsbT7CD36bmXcba6Lj607QESqAMQgVQBuSpq
         jh39lVYqPh+1Ogv3EbXTKnlf1tzvHGr55EceXIgfbQmKbJ/LioowgPDytlQ9yUmDJyJo
         pKbi5TUPt5JcpldC8xmI81LKygY/zOGOdFE3t8r6pqe8bLHDGK7a11Xaatde0kNQFo4A
         YVE2XMJ3YrA80bTwhRnfWVMkrqObRPD8PNejHrg/3Eglz2QS+Utt2mFBUMLp3PZQnbVp
         Mzl8wF5Ez2ZlYw+HMX2s1+lY4zRMEtSjZ09fjNw061JFCxGVqfaLAUO47e+Ehv8HrZ4B
         L7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrkVtOBxnk3WwmxvketIx3YGCzGOCGYYUSc4ibrxQPgWLUyANLacNyac2x1G+ctaHpVhfA6PAGZE8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGfTjpoPpF0p1/P+XxZtswruYhRRWkqYL0fePMEUFKqVFm3b6L
	28q0TrIWwLEgiQwFUdCZw39vw7REWAt1Eg9zAm+YJ6mm9smqn9j2rfI7Cn8xzY3k929rlnXUNWL
	2wyEqcRekBb0/wJyoPVCvJbtnkCfC3GAuS50IkPMcFw==
X-Gm-Gg: ASbGncsjn4ivCySnBGzxPhm1lTOPnHXjDYD67Q4Bl1qYIhgljlsmDLtQ6z5wk+tmabr
	eaUzGG41dZ2VQCJ4PwMZEEGkEuXawAiLLhMbsuxKVdWtC3scHFJoRlrLDBSdraGYoUlMpaYw20E
	vA4AKVWRis444EPUKIuhMMfrjhoFS/YBV07YiQrHfRzS6upsOQ9bJeKDQlRC8vMfx55FV65bYCF
	xnsM/QgZ0y9VkDiw13NkkCxZWQkUxWgnrA8XWYOhz2Xs26pXxLP5R/W0wqxnz/c8G0cqoAA
X-Google-Smtp-Source: AGHT+IEq9I1p8OP3yDbh00Mj9+qoqszlTYDSFXyp8DuqLQvxre/JkxTDPf1QjwQFRLpKChHb1al8+Tk6n1fWExeFbow=
X-Received: by 2002:a05:6e02:3044:b0:433:258e:5a92 with SMTP id
 e9e14a558f8ab-4335f479c79mr44021005ab.32.1762513440480; Fri, 07 Nov 2025
 03:04:00 -0800 (PST)
MIME-Version: 1.0
References: <20251103062825.9084-1-dayss1224@gmail.com>
In-Reply-To: <20251103062825.9084-1-dayss1224@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Nov 2025 16:33:48 +0530
X-Gm-Features: AWmQ_bktMTn5j_WJdcxCdJE6SpTHSxLvgVWZIkGAWguCXPvlqqDsCY8TuZP0sdM
Message-ID: <CAAhSdy01XGT6psT+3EgHbgyyOhuXP63Zv1K2acvDZKD0LxxQ=w@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Support enabling dirty log gradually in small chunks
To: dayss1224@gmail.com
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_030401_715269_59D0CC2C 
X-CRM114-Status: GOOD (  24.44  )
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

T24gTW9uLCBOb3YgMywgMjAyNSBhdCAxMTo1OOKAr0FNIDxkYXlzczEyMjRAZ21haWwuY29tPiB3
cm90ZToKPgo+IEZyb206IERvbmcgWWFuZyA8ZGF5c3MxMjI0QGdtYWlsLmNvbT4KPgo+IFRoZXJl
IGlzIGFscmVhZHkgc3VwcG9ydCBvZiBlbmFibGluZyBkaXJ0eSBsb2cgZ3JhZHVhbGx5IGluIHNt
YWxsIGNodW5rcwo+IGZvciB4ODYgaW4gY29tbWl0IDNjOWJkNDAwNmJmYyAoIktWTTogeDg2OiBl
bmFibGUgZGlydHkgbG9nIGdyYWR1YWxseSBpbgo+IHNtYWxsIGNodW5rcyIpIGFuZCBjODYyNjI2
ICgiS1ZNOiBhcm02NDogU3VwcG9ydCBlbmFibGluZyBkaXJ0eSBsb2cKPiBncmFkdWFsbHkgaW4g
c21hbGwgY2h1bmtzIikuIFRoaXMgYWRkcyBzdXBwb3J0IGZvciByaXNjdi4KPgo+IHg4NiBhbmQg
YXJtNjQgd3JpdGVzIHByb3RlY3QgYm90aCBodWdlIHBhZ2VzIGFuZCBub3JtYWwgcGFnZXMgbm93
LCBzbwo+IHJpc2N2IHByb3RlY3QgYWxzbyBwcm90ZWN0cyBib3RoIGh1Z2UgcGFnZXMgYW5kIG5v
cm1hbCBwYWdlcy4KPgo+IE9uIGEgbmVzdGVkIHZpcnR1YWxpemF0aW9uIHNldHVwIChSSVNDLVYg
S1ZNIHJ1bm5pbmcgaW5zaWRlIGEgUUVNVSBWTQo+IG9uIGFuIFtJbnRlbMKuIENvcmXihKIgaTUt
MTI1MDBIXSBob3N0KSwgSSBkaWQgc29tZSB0ZXN0cyB3aXRoIGEgMkcgTGludXgKPiBWTSB1c2lu
ZyBkaWZmZXJlbnQgYmFja2luZyBwYWdlIHNpemVzLiBUaGUgdGltZSB0YWtlbiBmb3IKPiBtZW1v
cnlfZ2xvYmFsX2RpcnR5X2xvZ19zdGFydCBpbiB0aGUgTDIgUUVNVSBpcyBsaXN0ZWQgYmVsb3c6
Cj4KPiBQYWdlIFNpemUgICAgICBCZWZvcmUgICAgQWZ0ZXIgT3B0aW1pemF0aW9uCj4gICA0SyAg
ICAgICAgICAgIDQ0OTAuMjNtcyAgICAgICAgIDMxLjk0bXMKPiAgIDJNICAgICAgICAgICAgIDQ4
Ljk3bXMgICAgICAgICAgNDUuNDZtcwo+ICAgMUcgICAgICAgICAgICAgMjguNDBtcyAgICAgICAg
ICAzMC45M21zCj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFj
LmNuPgo+IFNpZ25lZC1vZmYtYnk6IERvbmcgWWFuZyA8ZGF5c3MxMjI0QGdtYWlsLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVl
ZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjE5CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBEb2N1
bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgfCAyICstCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8IDMgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAg
ICAgICB8IDUgKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0
IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gaW5kZXggNTcwNjFmYTI5ZTZhLi4z
YjYyMWMzYWU2N2MgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gQEAgLTgwMjgsNyArODAy
OCw3IEBAIHdpbGwgYmUgaW5pdGlhbGl6ZWQgdG8gMSB3aGVuIGNyZWF0ZWQuICBUaGlzIGFsc28g
aW1wcm92ZXMgcGVyZm9ybWFuY2UgYmVjYXVzZQo+ICBkaXJ0eSBsb2dnaW5nIGNhbiBiZSBlbmFi
bGVkIGdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3Mgb24gdGhlIGZpcnN0IGNhbGwKPiAgdG8gS1ZN
X0NMRUFSX0RJUlRZX0xPRy4gIEtWTV9ESVJUWV9MT0dfSU5JVElBTExZX1NFVCBkZXBlbmRzIG9u
Cj4gIEtWTV9ESVJUWV9MT0dfTUFOVUFMX1BST1RFQ1RfRU5BQkxFIChpdCBpcyBhbHNvIG9ubHkg
YXZhaWxhYmxlIG9uCj4gLXg4NiBhbmQgYXJtNjQgZm9yIG5vdykuCj4gK3g4NiwgYXJtNjQgYW5k
IHJpc2N2IGZvciBub3cpLgo+Cj4gIEtWTV9DQVBfTUFOVUFMX0RJUlRZX0xPR19QUk9URUNUMiB3
YXMgcHJldmlvdXNseSBhdmFpbGFibGUgdW5kZXIgdGhlIG5hbWUKPiAgS1ZNX0NBUF9NQU5VQUxf
RElSVFlfTE9HX1BST1RFQ1QsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaGFkIGJ1Z3MgdGhhdCBt
YWtlCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDRkNzk0NTczZTNkYi4uODQ4
YjYzZjg3MDAxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC01OSw2ICs1
OSw5IEBACj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoSVJR
X1ZTX1RJTUVSKSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJJVChJUlFfVlNfRVhUKSkKPgo+ICsjZGVmaW5lIEtWTV9ESVJUWV9MT0dfTUFOVUFMX0NBUFMg
ICAoS1ZNX0RJUlRZX0xPR19NQU5VQUxfUFJPVEVDVF9FTkFCTEUgfCBcCj4gKyAgICAgICBLVk1f
RElSVFlfTE9HX0lOSVRJQUxMWV9TRVQpCj4gKwo+ICBzdHJ1Y3Qga3ZtX3ZtX3N0YXQgewo+ICAg
ICAgICAgc3RydWN0IGt2bV92bV9zdGF0X2dlbmVyaWMgZ2VuZXJpYzsKPiAgfTsKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4
IDUyNWZiNWEzMzBjMC4uYTE5NGVlZTI1NmQ4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtMTYxLDggKzE2MSwxMSBA
QCB2b2lkIGt2bV9hcmNoX2NvbW1pdF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAg
ICAgICAgICAqIGFsbG9jYXRlZCBkaXJ0eV9iaXRtYXBbXSwgZGlydHkgcGFnZXMgd2lsbCBiZSB0
cmFja2VkIHdoaWxlCj4gICAgICAgICAgKiB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVj
dGVkLgo+ICAgICAgICAgICovCj4gLSAgICAgICBpZiAoY2hhbmdlICE9IEtWTV9NUl9ERUxFVEUg
JiYgbmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKQo+ICsgICAgICAgaWYgKGNo
YW5nZSAhPSBLVk1fTVJfREVMRVRFICYmIG5ldy0+ZmxhZ3MgJiBLVk1fTUVNX0xPR19ESVJUWV9Q
QUdFUykgewo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtX2RpcnR5X2xvZ19tYW51YWxfcHJvdGVj
dF9hbmRfaW5pdF9zZXQoa3ZtKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4g
ICAgICAgICAgICAgICAgIG1tdV93cF9tZW1vcnlfcmVnaW9uKGt2bSwgbmV3LT5pZCk7Cj4gKyAg
ICAgICB9Cj4gIH0KPgo+ICBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVj
dCBrdm0gKmt2bSwKPiAtLQo+IDIuMzQuMQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
