Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063FAC7EE3A
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ty7WzQtuuHoXIAzm06KqF26gb9CUzeLtWc5UAAUCDbQ=; b=WWH9ziBEl1lJZD
	rp5Xw3enZVmHOrvzwDnqCfbfAe5rLXSEE6fLm2OrQAZVJmsRZknoSetqzIW80ffUvu1wTzQnrltvX
	vlUEUIDl5IPsCKtXVdFVv8nCfgNWcRJS4j7nvFkaZz02OzgGL5Q47gZoPIOT6ncrRFY5pfcwiLhry
	vazi3e/FF7B/VkQ3Riw0P+0lFXqVmdXzLnxKlFVXB8ppAYVptyw4r7HiDuhJ8shbk3A1QOzn66fdH
	L3qkDJlRSQM3te+XhI1rHmmsQExPoiNxLRfXhioLgVd8a5nncv3ZWtBmFUIvU1gbYhMKM/8fGTbOM
	ZhzziPrfOSKHZKNBQ9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrs-00000009ZTc-2nXF;
	Wed, 25 Jun 2025 18:29:08 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURA4-00000008yX9-0pTC
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:31:41 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-532dbe71e4eso1811402e0c.2
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Jun 2025 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750861898; x=1751466698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNEFN1NKG+swatDYQI6HrjoJU0jdsCu1bPMlAu48h0g=;
        b=oR+yUi7E7FXF2KavJSNRZtb/PKNtJEU36Z1Er/4NXrYRtMVRCVu8w+Qc8vZ4lf+Suh
         W0fhFlMyLkBbyHWhw2KBmsO9wxzQyx1h+9uqLpi5K5KZCF6/oGFgZhdQuMr5zsTmrnWw
         SmSHGMruhq4XwuOOcVzsKal8ln3Gt5q2nCqkSl1lwQUk8CBDK24oJxlaA3LyjNTOg0j2
         EaX3YIZ/xzfgvXlBicYuubWbLhe9fIXzg4pHvqL402gUpEAZuByulKCGq/9uaxIvpD5V
         /BS7JbDhz9JbDdOYJSalBe+6gNSFyF7SEhluTm9XIVOGI749M/Q/SKDRs8/QQ8xvTZ+u
         ztYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861898; x=1751466698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNEFN1NKG+swatDYQI6HrjoJU0jdsCu1bPMlAu48h0g=;
        b=KxAxfpGAV9CkgMG53Y2on2Jz86mU3+0i1VHST2p7lGzKkl1nCCM0XgAcMUNecDXsZ7
         dfOeZKqXIKAW5Uy7DAi6SBJ+KHt4DMehtlKJRBeeniy/SD8UXifjDumeDdOh7Ej8drjA
         qy93mjT0XC4afSIPaKkMN+DQL6B3puGsQxlKkBV6K0C0iqXNAy8Rn1lUyw39A6wCQOmJ
         GJ74tZJ9QU5TbaWrFKAE7iMmqfbzxpmIcXOktibRmDk3HpYwTNpNUB3h2VPSk0KENdOa
         AXrQcctIDXolkSfIa3chclsaBcKEoX4szLCG9O7VDSJCAC9qPnE1NBn0agQZ36vSmduP
         82ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0YMzw9lVVtT3ZJ32NaxlsWeSNUZynb/qtpM2YrV3KFvu5m/CAP7ay+spTppq3DerDknyB5U/SkK4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yza8MMRSP64JZNqZgaX8osjqeEeCnvDXzROP8P3V0yBUHDuR9Tp
	s/r42LC1d31oFNWv9VZLK4yzf2awnXGkZEjti6Dgu9vJOhHugp9t3K9UWlAV6nJzbVdsjgwWOFv
	ADxeVgptDKDKLdoiHNrZDZs30+whHBx7QELLSR+hInA==
X-Gm-Gg: ASbGncsfZdhv5/P5K16KnUz0ANN59cHFCa9knRS1+Ix+hHZW09NpQaITnNT7Vojcy/5
	GoSSIaOrE/eWRy8R+CShTUYSuLqzdfoRUkb0ohPpEldQlvKtS53lMS4oRjHXJ3AV/OjE6NL/VAL
	Bvznj+gdLYoIlh1LD6DXxOArvQWOeQO2rrznLF9T4mmiLV
X-Google-Smtp-Source: AGHT+IFKZk8yDb57dXdu1goU1780yjICESJYQ6+NBRPRFD400b1dsKCn0S2Grq/YbRlUVTvVl3LuPip1M1XE7G/Op0c=
X-Received: by 2002:a05:6122:438b:b0:52a:79fd:34bd with SMTP id
 71dfb90a1353d-532ef3d28c7mr2189962e0c.4.1750861898326; Wed, 25 Jun 2025
 07:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250624192317.278437-1-jesse@rivosinc.com> <20250625-fc81fec2cf6d7ee195c0eb6c@orel>
In-Reply-To: <20250625-fc81fec2cf6d7ee195c0eb6c@orel>
From: Jesse Taube <jesse@rivosinc.com>
Date: Wed, 25 Jun 2025 07:31:27 -0700
X-Gm-Features: Ac12FXyDu2tWflqx0iVeOG6H8MMrg5H_8TMwkiqA4xvmkjqXYVxH_T-zC7snMds
Message-ID: <CALSpo=ZsEEQeoYz2dby9B4zgbFcxCzmjN9SH8Jch4Avvm14Cog@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2] riscv: lib: sbi_shutdown add pass/fail
 exit code.
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_073140_345217_9AC4A5A0 
X-CRM114-Status: GOOD (  30.40  )
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTozM+KAr0FNIEFuZHJldyBKb25lcyA8YW5kcmV3Lmpv
bmVzQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCAxMjoyMzox
N1BNIC0wNzAwLCBKZXNzZSBUYXViZSB3cm90ZToKPiA+IFdoZW4gZXhpdGluZyBpdCBtYXkgYmUg
dXNlZnVsIGZvciB0aGUgc2JpIGltcGxlbWVudGF0aW9uIHRvIGtub3cgaWYKPiA+IGt2bS11bml0
LXRlc3RzIHBhc3NlZCBvciBmYWlsZWQuCj4gPiBBZGQgZXhpdCBjb2RlIHRvIHNiaV9zaHV0ZG93
biwgYW5kIHVzZSBpdCBpbiBleGl0KCkgdG8gcGFzcwo+ID4gc3VjY2Vzcy9mYWlsdXJlICgwLzEp
IHRvIHNiaS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3Np
bmMuY29tPgo+ID4gLS0tCj4gPiAgbGliL3Jpc2N2L2FzbS9zYmkuaCB8IDIgKy0KPiA+ICBsaWIv
cmlzY3YvaW8uYyAgICAgIHwgMiArLQo+ID4gIGxpYi9yaXNjdi9zYmkuYyAgICAgfCA0ICsrLS0K
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2L2FzbS9zYmkuaCBiL2xpYi9yaXNjdi9hc20vc2Jp
LmgKPiA+IGluZGV4IGE1NzM4YTVjLi5kZTExYzEwOSAxMDA2NDQKPiA+IC0tLSBhL2xpYi9yaXNj
di9hc20vc2JpLmgKPiA+ICsrKyBiL2xpYi9yaXNjdi9hc20vc2JpLmgKPiA+IEBAIC0yNTAsNyAr
MjUwLDcgQEAgc3RydWN0IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWdu
ZWQgbG9uZyBhcmcwLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJn
MywgdW5zaWduZWQgbG9uZyBhcmc0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgYXJnNSk7Cj4gPgo+ID4gLXZvaWQgc2JpX3NodXRkb3duKHZvaWQpOwo+ID4gK3ZvaWQg
c2JpX3NodXRkb3duKHVuc2lnbmVkIGludCBjb2RlKTsKPiA+ICBzdHJ1Y3Qgc2JpcmV0IHNiaV9o
YXJ0X3N0YXJ0KHVuc2lnbmVkIGxvbmcgaGFydGlkLCB1bnNpZ25lZCBsb25nIGVudHJ5LCB1bnNp
Z25lZCBsb25nIHNwKTsKPiA+ICBzdHJ1Y3Qgc2JpcmV0IHNiaV9oYXJ0X3N0b3Aodm9pZCk7Cj4g
PiAgc3RydWN0IHNiaXJldCBzYmlfaGFydF9nZXRfc3RhdHVzKHVuc2lnbmVkIGxvbmcgaGFydGlk
KTsKPiA+IGRpZmYgLS1naXQgYS9saWIvcmlzY3YvaW8uYyBiL2xpYi9yaXNjdi9pby5jCj4gPiBp
bmRleCBmYjQwYWRiNy4uMGJkZTI1ZDQgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvcmlzY3YvaW8uYwo+
ID4gKysrIGIvbGliL3Jpc2N2L2lvLmMKPiA+IEBAIC0xNTAsNyArMTUwLDcgQEAgdm9pZCBoYWx0
KGludCBjb2RlKTsKPiA+ICB2b2lkIGV4aXQoaW50IGNvZGUpCj4gPiAgewo+ID4gICAgICAgcHJp
bnRmKCJcbkVYSVQ6IFNUQVRVUz0lZFxuIiwgKChjb2RlKSA8PCAxKSB8IDEpOwo+ID4gLSAgICAg
c2JpX3NodXRkb3duKCk7Cj4gPiArICAgICBzYmlfc2h1dGRvd24oISFjb2RlKTsKPiA+ICAgICAg
IGhhbHQoY29kZSk7Cj4gPiAgICAgICBfX2J1aWx0aW5fdW5yZWFjaGFibGUoKTsKPiA+ICB9Cj4g
PiBkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2L3NiaS5jIGIvbGliL3Jpc2N2L3NiaS5jCj4gPiBpbmRl
eCAyOTU5Mzc4Zi4uOWRkMTFlOWQgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvcmlzY3Yvc2JpLmMKPiA+
ICsrKyBiL2xpYi9yaXNjdi9zYmkuYwo+ID4gQEAgLTEwNyw5ICsxMDcsOSBAQCBzdHJ1Y3Qgc2Jp
cmV0IHNiaV9zc2VfaW5qZWN0KHVuc2lnbmVkIGxvbmcgZXZlbnRfaWQsIHVuc2lnbmVkIGxvbmcg
aGFydF9pZCkKPiA+ICAgICAgIHJldHVybiBzYmlfZWNhbGwoU0JJX0VYVF9TU0UsIFNCSV9FWFRf
U1NFX0lOSkVDVCwgZXZlbnRfaWQsIGhhcnRfaWQsIDAsIDAsIDAsIDApOwo+ID4gIH0KPiA+Cj4g
PiAtdm9pZCBzYmlfc2h1dGRvd24odm9pZCkKPiA+ICt2b2lkIHNiaV9zaHV0ZG93bih1bnNpZ25l
ZCBpbnQgY29kZSkKPiA+ICB7Cj4gPiAtICAgICBzYmlfZWNhbGwoU0JJX0VYVF9TUlNULCAwLCAw
LCAwLCAwLCAwLCAwLCAwKTsKPiA+ICsgICAgIHNiaV9lY2FsbChTQklfRVhUX1NSU1QsIDAsIDAs
IGNvZGUsIDAsIDAsIDAsIDApOwo+ID4gICAgICAgcHV0cygiU0JJIHNodXRkb3duIGZhaWxlZCFc
biIpOwo+ID4gIH0KPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+Cj4gSSBlbmhhbmNlZCB0aGUg
Y29tbWl0IG1lc3NhZ2UsIGNoYW5nZWQgdGhlIHBhcmFtZXRlciB0byBhIGJvb2xlYW4sIGFuZAo+
IGFwcGxpZWQgdG8gcmlzY3Yvc2JpCj4KPiBodHRwczovL2dpdGxhYi5jb20vam9uZXMtZHJldy9r
dm0tdW5pdC10ZXN0cy8tL2NvbW1pdHMvcmlzY3Yvc2JpCj4KPiBidXQgSSdtIGhhdmluZyBzb21l
IHNlY29uZCB0aG91Z2h0cyBvbiBpdC4gSXQgbG9va3MgbGlrZSBvcGVuc2JpIGFuZCB0aGUKPiB0
d28gS1ZNIFZNTXMgSSBsb29rZWQgYXQgKFFFTVUgYW5kIGt2bXRvb2wpIGFsbCBjdXJyZW50bHkg
aWdub3JlIHRoaXMKPiBwYXJhbWV0ZXIgYW5kIHdlIGRvbid0IGtub3cgd2hhdCB0aGV5IG1pZ2h0
IGNob29zZSB0byBkbyBpZiB0aGV5IHN0b3AKPiBpZ25vcmluZyBpdC4KCkZvciB0aGUgZGVmYXVs
dCBzeXNjb24gUUVNVSBkb2Vzbid0IGlnbm9yZSBpdCBhbmQgZXhpdHMgd2l0aCB0aGUgZXhpdApj
b2RlIGdpdmVuLgpodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9ibG9iL21h
c3Rlci9ody9taXNjL3NpZml2ZV90ZXN0LmM/cmVmX3R5cGU9aGVhZHMjTDQ0CgpCb3RoIFJ1c3RT
QkkgYW5kIEJCTCBpbXBsZW1lbnQgdGhlIHNpZml2ZV90ZXN0IGRldmljZSBjb3JyZWN0bHkgYW5k
CnByb3ZpZGUgYW4gZXhpdCBjb2RlLApPcGVuU0JJIGlnbm9yZXMgaXQsIHRob3VnaCBpdCBpcyB0
cml2aWFsIHRvIGFkZCBpdC4KaHR0cHM6Ly9naXRodWIuY29tL3J1c3RzYmkvcnVzdHNiaS9ibG9i
L21haW4vcHJvdG90eXBlci9wcm90b3R5cGVyL3NyYy9wbGF0Zm9ybS9yZXNldC5ycyNMMjEKaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9yaXNjdi1way9ibG9iL21hc3Rlci9t
YWNoaW5lL2ZpbmlzaGVyLmMjTDE1Cgo+IEZvciBleGFtcGxlLCB0aGV5IGNvdWxkIGNob29zZSB0
byBoYW5nLCByYXRoZXIgdGhhbiBjb21wbGV0ZQo+IHRoZSBzaHV0ZG93biB3aGVuIHRoZXkgc2Vl
IGEgInN5c3RlbSBmYWlsdXJlIiByZWFzb24uIEl0IG1heSBtYWtlIHNlbnNlCj4gdG8gaW5kaWNh
dGUgc3lzdGVtIGZhaWx1cmUgaWYgdGhlIHRlc3QgYWJvcnRzLCBzaW5jZSwgaW4gdGhvc2UgY2Fz
ZXMsCj4gc29tZXRoaW5nIHVuZXhwZWN0ZWQgd2l0aCB0aGUgdGVzdGluZyBvY2N1cnJlZC4gSG93
ZXZlciwgc3VjY2Vzc2Z1bGx5Cj4gcnVubmluZyB0ZXN0cyB3aGljaCBmaW5kIGFuZCByZXBvcnQg
ZmFpbHVyZXMgaXNuJ3QgdW5leHBlY3RlZCwgc28gaXQKPiBzaG91bGRuJ3QgcmFpc2UgYW4gYWxh
cm0gdG8gdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBpbiB0aG9zZSBjYXNlcy4KPgo+IERvIHlvdSBh
bHJlYWR5IGhhdmUgYSB1c2VjYXNlIGZvciB0aGlzIGluIG1pbmQ/CgpZZXMgbWFraW5nIENJIGVh
c2llciwgYXMgdGhlIGV4aXQgY29kZSBpcyBwYXNzZWQgdG8gUUVNVSByYXRoZXIgdGhhbgpoYXZp
bmcgdG8gcGFyc2UgdGhlIHRleHQuCgo+IElmIHNvLCB3ZSBjb3VsZCBtYWtlCj4gdGhlIGJlaGF2
aW9yIG9wdGlvbmFsIHRvIGVuYWJsZSB0aGF0IHVzZSBjYXNlIGFuZCB1c2UgY2FzZXMgbGlrZSBp
dAo+IGJ1dCB3ZSdkIGtlZXAgdGhhdCBiZWhhdmlvciBvZmYgYnkgZGVmYXVsdCB0byBhdm9pZCBw
cm9ibGVtcyB3aXRoIFNCSQo+IGltcGxlbWVudGF0aW9ucyB0aGF0IGRvIHRoaW5ncyB3aXRoIHRo
ZSAic3lzdGVtIGZhaWx1cmUiIGluZm9ybWF0aW9uIHdlJ2QKPiByYXRoZXIgdGhleSBub3QgZG8u
CgpTdXJlLCBkbyB5b3Ugd2FudCBpdCB0byBiZSBhIGNvbmZpZ3VyZSBmbGFnIGxpa2UgIC0tY29u
c29sZT8KClRoYW5rcywKSmVzc2UgVGF1YmUKCj4KPiBUaGFua3MsCj4gZHJldwoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
