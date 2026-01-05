Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424BCC2A072
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNJUHONTv0w7nraNS+fsNKUVmkFCVsiov0FGgt/XXHA=; b=i2OT4gdoL2DpJl
	f/p0Ul75KTx1mDELC3ViV4rSWEzuWV8d0K4thgYiHCWBZGqzl+zDWyYoej57JW4g79WRHV8ufiH2v
	bCVL3Q44tQAdRftbENLRGBQDzIHLORl6XPIsZTYxc7X4b54BQSiDeYJw8DG938kl31Kb9Gcj4EaQN
	brqCXILLfMf+PUPauEgC1cg/AXmEtd4Lq0LjzNZhs/RsVDBf15HdMnbB3X5nOM9RRGg0DPWaTHbz/
	hafX71gJfr1t416xjwGjIqxF5PKv5ffRvm135snWE4ApFTzBKU7rcjesLrEW9TTp1TZ5E8FNRyE2E
	wPSI9hiW04RsjjpjD9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFn-0000000AhLV-0x80;
	Mon, 05 Jan 2026 04:31:39 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFi-0000000AhKk-4AqT
	for kvm-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 04:31:37 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-3ec6c10a295so5404088fac.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 20:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767587493; x=1768192293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXRh45S0E1wg+SbwJvRj0sTfGM+6MbGGitqWTepWxqA=;
        b=P6nmyTu7eJOQmLFmBQRqiBm758mSFDV0LoYy0+erKMgzXrkNtdpyh4w2xAnaDvji0S
         Fh4BC8UZDlF7OhVBEJpcfB20Fc0YtRo0S5BlQzANefUrkVaYc/7A+CnxNzujwfZzhMgF
         iGiUOf43mcC2oGRpOkECRl0llxoh6Egm4HoTj9o4hFOWK5INaVOS7QjOu5xlFOADrk/S
         VjUF5yudf8RKqhO5LA8Irikaj7Y2DwdomJzhsXYGeQVX1hr1iN6nHyQUvR0mz1zx9ErQ
         2t0HPS7QGzsBZw+Fg5r40582Ka0AQ5dRCZZ+cly7chBantwyMwtWalacZy3/mq7JvoaB
         SaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587493; x=1768192293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZXRh45S0E1wg+SbwJvRj0sTfGM+6MbGGitqWTepWxqA=;
        b=XhHAd3YMuDJSGk3NSlkfIyQd3AIHcsyYnHpG54e1V07rh5n4fEscWfE/im7YQeXI66
         82LTqjOJbeAFryqpm0SqNnNXSKJBP69/UJM/9X6GOLwVFE0hLDutY0Urej4DMx2/+xSm
         fPW7t98PQStIyK7rZ/OeHpA1MjPgZu4gpmDxDc6YiJzB6lNmg0gjIUuluBAGBDswrs1C
         rJT6uHZg8GqfGXRuXe1g/mNIOgjAGwgPivoyY56hSjc+cQraKLuAbcoa2yrREac6UYpR
         xWXo5XYgCn4wYdZyQ3OLuX37PPQhW8oeJDlsQNDBFE1762y1UNgd6LMyRqPUbMMn0eMb
         +Jqg==
X-Forwarded-Encrypted: i=1; AJvYcCWTaJ+Gxon7iPgqGaJsPpCG7Qw5Vi/e8uHlzc6XxuCabLJhKOuBSwfR+DjzY3aJGuYlljfXkynSRzQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf87Znsew2pFAjtpRhELmnZWY0k36atOGuVAkAtDsHYsmcP0Km
	IFlCoqjMu86Ij5nljxI/x7foVPyQJV6SKmzF9bEf+jfUDqVjeNA1XNAruyA4l8gNDdoyfcTTRE0
	7hfWWIbQueNie6EA8J3MsA9v6IyFwE0knv8LMiX37Ug==
X-Gm-Gg: AY/fxX6vytSuesWT7MhDaTF8Tv3l+HA08OABNE5mGIaiWDJWj6JEGqUZXVU3oSaFv6O
	1U42IcXr6VuJ8k/pF0AYWLUNdWAD1MsCHUY9hHhGyFV+4mxpzqy63raEnVC1pAH+t5J6HJHVXO+
	pFaSA6xm5K2H7+aCFJFCHacKkRx4QrHgTgcR4Y2Arm65m6fsTRN7pDKMjrHdeM4rEL89jot2EOT
	T7gXlAkK7mqnOx6aAiNi46WK4er+rEpzRpM/VZNbdawB3yrxgOkG2kOYHae1G1o87+6rQZta2TZ
	0neymOwA0c5PUmt1Vupqyj3zvJS1jT939F+KnrfuuUU58KZNE3H7MHD5tYnfcm+MaoBK
X-Google-Smtp-Source: AGHT+IEwkcDRlFymm0SPcnTgEwcBBNPUXBq54o6AH1iKbZWNrVdE8TDy/EhnihwLQhHoswrfeUq7eC4nfF3TU8/lvoI=
X-Received: by 2002:a4a:dcc8:0:b0:65d:7e5:d49d with SMTP id
 006d021491bc7-65d0eade78cmr16123734eaf.72.1767587493534; Sun, 04 Jan 2026
 20:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <20260104135938.524-3-naohiko.shimizu@gmail.com>
In-Reply-To: <20260104135938.524-3-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 10:01:22 +0530
X-Gm-Features: AQt7F2oifOmggNLxX3Gj-6EJLO4qsWCjAuonxgnVcRqV8UojPRmnf2HWnXWgnm4
Message-ID: <CAAhSdy2rH5Jt5t7zCRfFd5d1X7qG41QoUuWvKgwuKX=X3Wk6cA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_203135_320983_6AB34485 
X-CRM114-Status: GOOD (  17.61  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjMw4oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFJWMzIsIHVwZGF0aW5nIHRoZSA2NC1i
aXQgc3RpbWVjbXAgKG9yIHZzdGltZWNtcCkgQ1NSIHJlcXVpcmVzIHR3bwo+IHNlcGFyYXRlIDMy
LWJpdCB3cml0ZXMuIEEgcmFjZSBjb25kaXRpb24gZXhpc3RzIGlmIHRoZSB0aW1lciB0cmlnZ2Vy
cwo+IGR1cmluZyB0aGVzZSB0d28gd3JpdGVzLgo+Cj4gVGhlIFJJU0MtViBQcml2aWxlZ2VkIFNw
ZWNpZmljYXRpb24gKGUuZy4sIFNlY3Rpb24gMy4yLjEgZm9yIG10aW1lY21wKQo+IHJlY29tbWVu
ZHMgYSBzcGVjaWZpYyAzLXN0ZXAgc2VxdWVuY2UgdG8gYXZvaWQgc3B1cmlvdXMgaW50ZXJydXB0
cwo+IHdoZW4gdXBkYXRpbmcgNjQtYml0IGNvbXBhcmlzb24gcmVnaXN0ZXJzIG9uIDMyLWJpdCBz
eXN0ZW1zOgo+Cj4gMS4gU2V0IHRoZSBsb3ctb3JkZXIgYml0cyAoc3RpbWVjbXApIHRvIGFsbCBv
bmVzIChVTE9OR19NQVgpLgo+IDIuIFNldCB0aGUgaGlnaC1vcmRlciBiaXRzIChzdGltZWNtcGgp
IHRvIHRoZSBkZXNpcmVkIHZhbHVlLgo+IDMuIFNldCB0aGUgbG93LW9yZGVyIGJpdHMgKHN0aW1l
Y21wKSB0byB0aGUgZGVzaXJlZCB2YWx1ZS4KPgo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gd3Jp
dGVzIHRoZSBMU0IgZmlyc3Qgd2l0aG91dCBlbnN1cmluZyBhIGZ1dHVyZQo+IHZhbHVlLCB3aGlj
aCBtYXkgbGVhZCB0byBhIHRyYW5zaWVudCBzdGF0ZSB3aGVyZSB0aGUgNjQtYml0IGNvbXBhcmlz
b24KPiBpcyBpbmNvcnJlY3RseSBldmFsdWF0ZWQgYXMgImV4cGlyZWQiIGJ5IHRoZSBoYXJkd2Fy
ZS4gVGhpcyByZXN1bHRzIGluCj4gc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPgo+IFRoaXMg
cGF0Y2ggYWRvcHRzIHRoZSBzcGVjLXJlY29tbWVuZGVkIDMtc3RlcCBzZXF1ZW5jZSB0byBlbnN1
cmUgdGhlCj4gaW50ZXJtZWRpYXRlIDY0LWJpdCBzdGF0ZSBpcyBuZXZlciBzbWFsbGVyIHRoYW4g
dGhlIGN1cnJlbnQgdGltZS4KPgo+IEZpeGVzOiA4ZjVjYjQ0YjFiYWUgKCJSSVNDLVY6IEtWTTog
U3VwcG9ydCBzc3RjIGV4dGVuc2lvbiIpCj4gU2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1
IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9yIExpbnV4
LTYuMTkuCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIu
YyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV90aW1lci5jCj4gaW5kZXggODVhNzI2MjExNWUxLi5mMzYyNDdlNGM3
ODMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV90aW1lci5jCj4gQEAgLTcyLDggKzcyLDkgQEAgc3RhdGljIGludCBr
dm1fcmlzY3ZfdmNwdV90aW1lcl9jYW5jZWwoc3RydWN0IGt2bV92Y3B1X3RpbWVyICp0KQo+ICBz
dGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X3VwZGF0ZV92c3RpbWVjbXAoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1NjQgbmN5Y2xlcykKPiAgewo+ICAjaWYgZGVmaW5lZChDT05GSUdfMzJCSVQpCj4g
LSAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVAsIG5jeWNsZXMgJiAweEZGRkZGRkZGKTsK
PiArICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgIFVMT05HX01BWCk7Cj4gICAgICAg
ICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVBILCBuY3ljbGVzID4+IDMyKTsKPiArICAgICAgIG5j
c3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMiluY3ljbGVzKTsKPiAgI2Vsc2UKPiAgICAgICAg
IG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgbmN5Y2xlcyk7Cj4gICNlbmRpZgo+IEBAIC0zMDcs
OCArMzA4LDkgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV90aW1lcl9yZXN0b3JlKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICNpZiBkZWZpbmVkKENP
TkZJR18zMkJJVCkKPiAtICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMil0LT5u
ZXh0X2N5Y2xlcyk7Cj4gKyAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVAsIFVMT05HX01B
WCk7Cj4gICAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVBILCAodTMyKSh0LT5uZXh0X2N5
Y2xlcyA+PiAzMikpOwo+ICsgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01QLCAodTMyKSh0
LT5uZXh0X2N5Y2xlcykpOwo+ICAjZWxzZQo+ICAgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1F
Q01QLCB0LT5uZXh0X2N5Y2xlcyk7Cj4gICNlbmRpZgo+IC0tCj4gMi4zOS41Cj4KCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
