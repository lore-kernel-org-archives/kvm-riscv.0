Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9672C54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=try/183N0iIKcs+yQyBnc9Iqthd8/kKo2fX6Kvz78O4=; b=WYJOVWdIae10Xj
	Z1lXvjttFHRpl6KMj88aHecLezM1nvPHL3XiyGGvW6s1675v/iXejLabu9ti/mN9EmNhUZ33f3ZIG
	cJErzEg6qr/0A8JAen0dbh3qOwT7L/3w9q9AZ/SZzXoZR9fgna+wzdeheaANbLo2oNXsMZcfkfUb2
	Mor9QBftenLuHSC+/qc7evzT48lyBFpKCue22j0AJdpHcBEoGeFrqDl3VN6q8vhN5A2iDjDHbAABf
	ED+5wtRuUNSOA53YHZCOIleVZuad5A7y10OKojoMm140apbW+5S8ludVdFueNx3ShyC5Y09LH7bbv
	rul/O/WXYgtEcEsILfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3dq-00000007wdk-0LM3;
	Wed, 29 Jul 2026 12:44:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3dn-00000007wcb-1frh
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:44:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495437bb891so7453495e9.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329045; cv=none;
        d=google.com; s=arc-20260327;
        b=hk9w+QLz+Ao06o9m0p9FjC2EKnzJ5I/9qnMmikShbNj1ADMfW4VfxE4zF0Kg1185bc
         gfZQYHMVmKoOpFc9lR28Lohq2iAiWiSr4XRzAUqLtvLZbgX/yQs6bPC3y1VGkOS0Q/gh
         HUOuNDDuS5zWa8uGgp7JtjPSsQiNIVldU9VST1sPu1poZpHIy22n7mmy/6cnmfttHg86
         Hco+T2cOt1WXcFSgrmqOtLm5C2/ncBz1Yo9/SC4xNnx90v9y8RrdczIEoBf1yLVahlO4
         /qF7Qix81SHEbqwRkDD1fMhyq5K8smhGUAyl28KPBPx0y6x1xYwdpfFweYCSKxJetj9O
         0MJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hm5r/xpzCIodGlWiNThjdtOQlm2HxnqjU/kCjY5K+u0=;
        fh=4XGnEM/yEW58+zBhTrS5gRk6isfQSWLKnOemsAbKZlw=;
        b=aS60aFON8AORG/JlDxY5YPZ65JJaQ4lj7pvPZoCZNMSjCj2H6e1wIrRJOwCMlWgHi8
         BNwhfDocpgefTOTYkg4pLssgWTVrAX4yZllwdpZ2QxbuxJBZhmHSK9p2GuYoKPwAAzMU
         AJiLIl65TVwkgmMEexvd08LR2U6oPG3kUTNC/tBxp8hj2JRkjeVDd99mSDKOlduldGI+
         KS+sl/EAmES/U/ebcgF4KmTqTWJHGgqq8kfFbDiISEls9sDc9AnL2gbY9oeA8BL/0T0w
         rYoZm9jQWZYRMztXEHAQPlK/q+1xIaOQvcedcmmI4vudhBjFfmURJGlEb4sU/zcTgJ3H
         gNCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329045; x=1785933845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hm5r/xpzCIodGlWiNThjdtOQlm2HxnqjU/kCjY5K+u0=;
        b=ogzZOmFLMkIunzvMUzaAsuv3wq9JYR+2VWs8B89RiCFRYgyCRkScJL+VR3riC4jdY6
         nGF2Lsx0i2eN4+nHTTwuTALRFquvCNPCy4Aeqhn6FsDcuWWUwgTd7gIO4EUHqkSG/GSb
         e0xTqVUxE30+wDn6PJE05oCNy2XbDVmf1834g3N53SQzIRe32EHROSyjx0f3car3JYMO
         IBn/29a0F1rBUagy+AFdQWMhp3kTlTpBXMPiB9sUjmlxBVyYSNoo/YS8wRtDfzh4sFa2
         baeFdGuhr2hpUCknYWmdU718GYPpxycq+2JupxpW9vB+zdHDm88bQKMvcRVrQ+owtHP2
         IZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329045; x=1785933845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hm5r/xpzCIodGlWiNThjdtOQlm2HxnqjU/kCjY5K+u0=;
        b=PGeR6LfETwgGuNBfgyKY4mS0WuNv9AO2RKPFxFGhdboNcO0RVn37GlrhqecQWvjyQS
         H2iRw2d9LTcWWjqxZEciGip2yZweGu44M+6zc3IgeC7cB9cD+yBO512w646WFahPwLHS
         6yvJ3YnyT81RQHmAzHYWXK1/Yq6vsZ/f6kRTTqML0AFbUfq8Kf+FPEen9kRX4lDAGhUv
         xdEmqYtwhj/HKhXcR2h3DLuPdBIMmvqhpEeyGn89Ei80FjZwznFiFfeh9PBkiXtFPnmv
         8jkdINDMrlkHV5iIQJviWaHwpVAVGkNqYg9e9tIPpGiP5PjzYsa0GVWXv9UzjUqcZfDt
         7diA==
X-Forwarded-Encrypted: i=1; AHgh+RpdfiuxbBz2Mh2cl3iYOf3olDHbLjucH/TBzybzgnWHJZCq8eGFnlMR7hURCUF44ueyMEynk9rGQWo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6QWIipGQvkyylVlx8YKE0yb5LROpJN17+vEnn0/sv341PWoeG
	+0hBBB5Ot/R7hzvVsVBWepeYv1lDAJIZYS0B3O9fWCOzOgqoyywGyI2AfIGEfjxaCrh2uCUs2hp
	97wKtkll/DJCASleQa/+u4Wct6tr0LirEdEIoJTtsvg==
X-Gm-Gg: AR+sD129ZO/3DBcTy5vR5rn3Xua+0C6yKf44BGu8TDdkadY1CNNniHPcPPS+U5c++Jb
	bt3+epIcbCLJwhTRbbAO2d0eVVmHtnVCk+Cvy3hgWOp9Di3ID9bkhD+I5hyzrX6vmghmhWbhE8C
	uW+zlI/wyz03bZlVRsOWoNPioDs2KPanXNAZMJOPNYAwOixafrIZ9fc/9GFM5H+X45BSqpdRoY/
	zVRkiyBTp05mmXPzluLhpZnREci6YgqUYQXE3Zo+UQJ5ESMbutBb8YpFoMUTqlnD8i6zf/Yk6Ou
	yKdbPc8TJ0UXZuc5OPD/qi/yHWL/fZ1z3BippNiMp502dirdN8AZnXkCYDUYk/xfqX4Kkr45RVW
	kIHhw3nGs+QkYiPGYtUe7xy5TGHRNYYFCFHNGTmZmb12rssSqflcJ0zdwFeAt4Cs=
X-Received: by 2002:a05:600c:4746:b0:495:3c6f:7c18 with SMTP id
 5b1f17b1804b1-497fd2f50bbmr22311715e9.3.1785329045078; Wed, 29 Jul 2026
 05:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-2-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-2-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:13:52 +0530
X-Gm-Features: AUfX_mwNGvCJ0K_M3RbragaNPirqy3_PcAwefERtLMiHMQvQ2ITGlUlXogu6tRE
Message-ID: <CAAhSdy2dGry-jgpCGJyH6-qRbp2WVsJU39XskkigxCdyxmi=eQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] RISC-V: KVM: Add support for Svadu FWFT features
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_054407_729914_CDE55EBB 
X-CRM114-Status: GOOD (  22.40  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRz
IGlzIGNvbnRyb2xsZWQgdGhyb3VnaCBBRFVFIGJpdCBpbgo+IGhlbnZjZmcgRXhwb3NlIHRoZSBm
ZWF0dXJlIG9ubHkgaWYgYm90aCBTdmFkdSBhbmQgU3ZhZGUgYXJlIHN1cHBvcnRlZAo+IGZvciBW
Uy1tb2RlLgo+Cj4gQWxsb3cgdGhlIFZNTSB0byBlbmFibGUvZGlzYWJsZSB0aGlzIGZlYXR1cmUg
YnkgY2hhbmdlIHRoZSBJU0EKPiBleHRlbnNpb24gc3RhdGUgaW4gdGhlIGd1ZXN0Lgo+Cj4gQXNz
aXN0ZWQtYnk6IFl1YW5TaGVuZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9wZWQtYnk6IFF1
YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91
IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxp
bm9jaGlhbWFAZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
a3ZtLmggfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICB8IDc2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggNTA0ZTczMzA1
MzQzLi43YmJlYTg4MTJkOTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAg
LTI0MCw2ICsyNDAsNyBAQCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0X2ZlYXR1cmUgewo+ICBz
dHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0IHsKPiAgICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2Jp
X2Z3ZnRfZmVhdHVyZSBtaXNhbGlnbmVkX2RlbGVnOwo+ICAgICAgICAgc3RydWN0IGt2bV9yaXNj
dl9zYmlfZndmdF9mZWF0dXJlIHBvaW50ZXJfbWFza2luZzsKPiArICAgICAgIHN0cnVjdCBrdm1f
cmlzY3Zfc2JpX2Z3ZnRfZmVhdHVyZSBwdGVfYWRfaHdfdXBkYXRpbmc7Cj4gIH07Cj4KPiAgLyog
SWYgeW91IG5lZWQgdG8gaW50ZXJwcmV0IHRoZSBpbmRleCB2YWx1ZXMsIGhlcmUgaXMgdGhlIGtl
eTogKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYWIzOWFjNDY0ZmZkLi40ZDQ3NGE0
MzliMjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTk0LDYgKzk0LDQ1IEBAIHN0
YXRpYyBib29sIGt2bV9md2Z0X2lzX2RlZmluZWRfZmVhdHVyZShlbnVtIHNiaV9md2Z0X2ZlYXR1
cmVfdCBmZWF0dXJlKQo+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICB9Cj4KPiArc3RhdGljIHZv
aWQga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQg
ZmxhZykKClRyeSB0byB1c2UgdXB0byA4MC05MCBjaGFyYWN0ZXJzIHBlci1saW5lLgoKcy9rdm1f
c2JpX2Z3ZnRfZW52X2ZsYWdfcmVzZXRfaGVscGVyL2t2bV9zYmlfZndmdF9lbnZjZmdfZmxhZ19y
ZXNldC8KCj4gK3sKPiArICAgICAgIHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcgJj0gfmZsYWc7Cj4g
K30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9lbnZfZmxhZ19zZXRfaGVscGVyKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWUsIHU2NCBmbGFnKQoKcy9rdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfc2V0X2hlbHBlci9r
dm1fc2JpX2Z3ZnRfZW52Y2ZnX2ZsYWdfc2V0LwoKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV92
Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+ICsKPiArICAgICAgIGlmICh2YWx1
ZSA9PSAwKQo+ICsgICAgICAgICAgICAgICBjZmctPmhlbnZjZmcgJj0gfmZsYWc7Cj4gKyAgICAg
ICBlbHNlIGlmICh2YWx1ZSA9PSAxKQo+ICsgICAgICAgICAgICAgICBjZmctPmhlbnZjZmcgfD0g
ZmxhZzsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5W
QUxJRF9QQVJBTTsKPiArCj4gKyAgICAgICBpZiAoIW9uZV9yZWdfYWNjZXNzKSB7Cj4gKyAgICAg
ICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyk7
Cj4gKyAgICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9IRU5WQ0ZHSCwgdmNwdS0+YXJjaC5jZmcu
aGVudmNmZyA+PiAzMik7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIFNCSV9TVUND
RVNTOwo+ICt9Cj4gKwo+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfZ2V0X2hl
bHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBvbmVfcmVnX2Fj
Y2VzcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nICp2YWx1ZSwgdTY0IGZsYWcpCgpzL2t2bV9zYmlfZndmdF9lbnZfZmxhZ19nZXRf
aGVscGVyL2t2bV9zYmlfZndmdF9lbnZjZmdfZmxhZ19nZXQvCgo+ICt7Cj4gKyAgICAgICAqdmFs
dWUgPSAodmNwdS0+YXJjaC5jZmcuaGVudmNmZyAmIGZsYWcpID09IGZsYWc7Cj4gKwo+ICsgICAg
ICAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+ICt9Cj4gKwo+ICBzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3
ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gIHsKPiAgICAgICAgIHJldHVybiBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSgpOwo+
IEBAIC0xMzcsNiArMTc2LDM0IEBAIHN0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9nZXRfbWlzYWxp
Z25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIHJldHVybiBT
QklfU1VDQ0VTUzsKPiAgfQo+Cj4gK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9wdGVfYWRfaHdf
dXBkYXRpbmdfc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAg
cmV0dXJuIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTVkFE
VSkgJiYKPiArICAgICAgICAgICAgICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNw
dS0+YXJjaC5pc2EsIFNWQURFKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQga3ZtX3NiaV9md2Z0
X3Jlc2V0X3B0ZV9hZF9od191cGRhdGluZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiAr
ICAgICAgIGlmIChrdm1fc2JpX2Z3ZnRfcHRlX2FkX2h3X3VwZGF0aW5nX3N1cHBvcnRlZCh2Y3B1
KSkKPiArICAgICAgICAgICAgICAga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcih2
Y3B1LCBFTlZDRkdfQURVRSk7Cj4gK30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9z
ZXRfcHRlX2FkX2h3X3VwZGF0aW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0
X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLCB1bnNpZ25lZCBsb25nIHZhbHVlKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3NldF9oZWxwZXIodmNwdSwgY29u
Ziwgb25lX3JlZ19hY2Nlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsdWUsIEVOVkNGR19BRFVFKTsKPiArfQo+ICsKPiArc3RhdGljIGxvbmcg
a3ZtX3NiaV9md2Z0X2dldF9wdGVfYWRfaHdfdXBkYXRpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcg
KnZhbHVlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX2dldF9o
ZWxwZXIodmNwdSwgY29uZiwgb25lX3JlZ19hY2Nlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUsIEVOVkNGR19BRFVFKTsKPiArfQo+ICsK
PiAgI2lmbmRlZiBDT05GSUdfMzJCSVQKPgo+ICBzdGF0aWMgYm9vbCB0cnlfdG9fc2V0X3BtbSh1
bnNpZ25lZCBsb25nIHZhbHVlKQo+IEBAIC0yNDYsNiArMzEzLDE1IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPiAgICAgICAgICAgICAg
ICAgLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICAgICAg
ICAgICAgICAgICAuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24s
Cj4gICAgICAgICB9LAo+ICsgICAgICAgewo+ICsgICAgICAgICAgICAgICAuaWQgPSBTQklfRldG
VF9QVEVfQURfSFdfVVBEQVRJTkcsCj4gKyAgICAgICAgICAgICAgIC5maXJzdF9yZWdfbnVtID0g
b2Zmc2V0b2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdCwgcHRlX2FkX2h3X3VwZGF0aW5nLmVu
YWJsZSkgLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1bnNpZ25l
ZCBsb25nKSwKPiArICAgICAgICAgICAgICAgLnN1cHBvcnRlZCA9IGt2bV9zYmlfZndmdF9wdGVf
YWRfaHdfdXBkYXRpbmdfc3VwcG9ydGVkLAo+ICsgICAgICAgICAgICAgICAucmVzZXQgPSBrdm1f
c2JpX2Z3ZnRfcmVzZXRfcHRlX2FkX2h3X3VwZGF0aW5nLAo+ICsgICAgICAgICAgICAgICAuc2V0
ID0ga3ZtX3NiaV9md2Z0X3NldF9wdGVfYWRfaHdfdXBkYXRpbmcsCj4gKyAgICAgICAgICAgICAg
IC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X3B0ZV9hZF9od191cGRhdGluZywKPiArICAgICAgIH0s
Cj4gICNpZm5kZWYgQ09ORklHXzMyQklUCj4gICAgICAgICB7Cj4gICAgICAgICAgICAgICAgIC5p
ZCA9IFNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTiwKPiAtLQo+IDIuNTUuMAo+CgpPdGhl
cndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
