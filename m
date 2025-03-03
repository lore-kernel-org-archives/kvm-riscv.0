Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C2C282C6
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 21:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+xBJkUKhFK+T9cS6oaXvgyLa98woh+8BT6l+jXqfi0=; b=LlVTdFfgLzUohc
	et9glE2TGWFqtm4YbbQc86LPnRhuUPDoqmwA1t+1q1NZzsJ9rPfTuH4vtqavn5jJ2cIIwz88tk/9H
	uGtVAh+4tzIuSxo+gKRKHihJJQXfA2iu9bUy+Wzno3JwsZIzA13HJlRl/H1ss8/AOFLnbJzWS3Jsc
	jspUK3+CXYwTWa7APcsu8R6njfQqYTXz6hecsG5vJjqbvBaZnbzEfWSjHp0Ts5kxB7Ul8qN02AJFu
	NI9WJc/oduQO7BgG8htDFnUObLOLqv2VDHHUngRXogjV0u2iAPnF4HnkntRs/WuczhODeHjEvojeu
	Yngx7LdbC3TLVbh5/3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDKV-00000002Mhz-2JZZ;
	Mon, 03 Mar 2025 21:28:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDKR-00000002Mh5-2NPD
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 21:28:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22349bb8605so95255785ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Mar 2025 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741037278; x=1741642078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5+6u/YZI5K5WSEGZ9NbKf7JrIHJ+VjnAiqNVQjLR1U=;
        b=JdJmcttjwC3TFd49B2vIM6Aq4BiHQguWE2EnBJEemnl86ObZ7O0EC2mJVqhTTuO8oS
         IUi2cmYHNCFPyZpFLb8i4BzxIZcwtqRwDd3PfMV6BA2iVzsz6kugXkRmEIlVlyFGt2Q/
         7fd+88MiA2eldvbtziWyLahW0N8c6VHfZIXufyDC0R+FQ8uFClhUjxYWpXZJzQ86l31U
         VA66HO4BVYdR7m+noGQoepwaHOiMfWKJYIHYReieG2KXCKCzAoxuwUqg1B+MiG/FPtYL
         tpmTq2puwYvbdBTMu3OMOf2e1KOTpPiYWk3DHWFIv5PEWmf2FneYttP+/1KDo7BOthAE
         NBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741037278; x=1741642078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5+6u/YZI5K5WSEGZ9NbKf7JrIHJ+VjnAiqNVQjLR1U=;
        b=NEY3nPyf8GN/+LWnONh3L3COrJ6Ym0D/W/vMCYP/JVSXmQMNDGNpfR6nsk+V6Ztpvh
         bBcqd/EikVlIrZPMMdosPcNKaQ31+MaYK0Duhb7DN/4IsWiNDHBzKVCh2HisYBsY1knp
         K948ibmcVyzv5XaRwAIj8WsG2fhhAzbXaS1uk/zUodYiibvjIaWZKJqrxgvKBsg1KGNY
         8JRsoBqybfVAfKbGdnQk3GQz6MTk5aBHQdlqx9Wwa7mlMzSGNypfxl1f1loXb05XL4e6
         jJ+dGcC3mZX21WJOK7Fxa5niUw3c1xKDu0fd7sS0zP4VGdrB83nqekkWIvofeiaOPPVf
         WFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHQ74LVI+539zqmze+NrWZ5HsPL3WmvHxRlYTYf+ZmIHZ4db5CPwdCH+BVsRLD8ceEpRm1KCop1MI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8WIQDZspfqEYRxpuo9w7hiKf/zMCwTQ8wEblwStpKZiZfvdVp
	aD9fH56YaQWmTmfqEMguEu2zTUVVs4c6/e9OjLK/jxG7GzDVhZZ7ShEIAXwKeuCvkqKaCEm7CDk
	Kr7d5ODz+lgDjAUJOipKF/Ef5xyztmkCJ6ySCsg==
X-Gm-Gg: ASbGncswU8vL9gsM429p8q6tQSyttgGTypRlg4ekDzUVdSTamFuLPFuxKs5qEhxzhe/
	eJBmyq2J0KuUQlAuSco4E7ij+gudAxs7UeTXf0YaiB4n2HOOHAqHAW9bxd8DMZkK0amDGNetJNw
	mTlFsR8PyMaQjvtPs5hmJIYnb5
X-Google-Smtp-Source: AGHT+IFWa898pYBSsl/XtTire00C+/Mez1s46zY3VD5s0DWQi6LGPCXHd85UBauAj0l5XQztYMk3Koj9EeRJt1F3O/w=
X-Received: by 2002:a05:6a00:10d5:b0:736:54c9:df2c with SMTP id
 d2e1a72fcca58-73654c9e5damr7398143b3a.15.1741037278523; Mon, 03 Mar 2025
 13:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com> <20250227-f7b303813dab128b5060b0c3@orel>
In-Reply-To: <20250227-f7b303813dab128b5060b0c3@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 3 Mar 2025 13:27:47 -0800
X-Gm-Features: AQ5f1JoAkFSTZhtomPL4SLm3WBUMZBjoFu7rVfDIUHdBaeUMfROdiGWXnMT4KxU
Message-ID: <CAHBxVyGGw6Ur4Kdd8Vvwp6viKWPx64w7gNvNiUzmAGeXF2PGoA@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Allow number of interrupts to
 be configurable
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_132759_608696_32EF7531 
X-CRM114-Status: GOOD (  31.61  )
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

T24gVGh1LCBGZWIgMjcsIDIwMjUgYXQgMTI6MTbigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDI2LCAyMDI1IGF0IDEyOjI1
OjA2UE0gLTA4MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gSXQgaXMgaGVscGZ1bCB0byB2YXJ5
IHRoZSBudW1iZXIgb2YgdGhlIExDT0ZJIGludGVycnVwdHMgZ2VuZXJhdGVkCj4gPiBieSB0aGUg
b3ZlcmZsb3cgdGVzdC4gQWxsb3cgYWRkaXRpb25hbCBhcmd1bWVudCBmb3Igb3ZlcmZsb3cgdGVz
dAo+ID4gdG8gYWNjb21tb2RhdGUgdGhhdC4gSXQgY2FuIGJlIGVhc2lseSBjcm9zcy12YWxpZGF0
ZWQgd2l0aAo+ID4gL3Byb2MvaW50ZXJydXB0cyBvdXRwdXQgaW4gdGhlIGhvc3QuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiAtLS0K
PiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMgfCAz
NiArKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5jCj4gPiBpbmRleCA1MzNiNzZkMGRlODIuLjdj
MjczYTFhZGIxNyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9y
aXNjdi9zYmlfcG11X3Rlc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3Jpc2N2L3NiaV9wbXVfdGVzdC5jCj4gPiBAQCAtMzksOCArMzksMTAgQEAgc3RhdGljIGJvb2wg
aWxsZWdhbF9oYW5kbGVyX2ludm9rZWQ7Cj4gPiAgI2RlZmluZSBTQklfUE1VX1RFU1RfU05BUFNI
T1QgICAgICAgIEJJVCgyKQo+ID4gICNkZWZpbmUgU0JJX1BNVV9URVNUX09WRVJGTE9XICAgICAg
ICBCSVQoMykKPiA+Cj4gPiArI2RlZmluZSBTQklfUE1VX09WRVJGTE9XX0lSUU5VTV9ERUZBVUxU
IDUKPiA+ICBzdHJ1Y3QgdGVzdF9hcmdzIHsKPiA+ICAgICAgIGludCBkaXNhYmxlZF90ZXN0czsK
PiA+ICsgICAgIGludCBvdmVyZmxvd19pcnFudW07Cj4gPiAgfTsKPiA+Cj4gPiAgc3RhdGljIHN0
cnVjdCB0ZXN0X2FyZ3MgdGFyZ3M7Cj4gPiBAQCAtNDc4LDcgKzQ4MCw3IEBAIHN0YXRpYyB2b2lk
IHRlc3RfcG11X2V2ZW50c19zbmFwaG9zdCh2b2lkKQo+ID4KPiA+ICBzdGF0aWMgdm9pZCB0ZXN0
X3BtdV9ldmVudHNfb3ZlcmZsb3codm9pZCkKPiA+ICB7Cj4gPiAtICAgICBpbnQgbnVtX2NvdW50
ZXJzID0gMDsKPiA+ICsgICAgIGludCBudW1fY291bnRlcnMgPSAwLCBpID0gMDsKPiA+Cj4gPiAg
ICAgICAvKiBWZXJpZnkgcHJlc2VuY2Ugb2YgU0JJIFBNVSBhbmQgbWluaW11bSByZXF1cmlyZWQg
U0JJIHZlcnNpb24gKi8KPiA+ICAgICAgIHZlcmlmeV9zYmlfcmVxdWlyZW1lbnRfYXNzZXJ0KCk7
Cj4gPiBAQCAtNDk1LDExICs0OTcsMTUgQEAgc3RhdGljIHZvaWQgdGVzdF9wbXVfZXZlbnRzX292
ZXJmbG93KHZvaWQpCj4gPiAgICAgICAgKiBRZW11IHN1cHBvcnRzIG92ZXJmbG93IGZvciBjeWNs
ZS9pbnN0cnVjdGlvbi4KPiA+ICAgICAgICAqIFRoaXMgdGVzdCBtYXkgZmFpbCBvbiBhbnkgcGxh
dGZvcm0gdGhhdCBkbyBub3Qgc3VwcG9ydCBvdmVyZmxvdyBmb3IgdGhlc2UgdHdvIGV2ZW50cy4K
PiA+ICAgICAgICAqLwo+ID4gLSAgICAgdGVzdF9wbXVfZXZlbnRfb3ZlcmZsb3coU0JJX1BNVV9I
V19DUFVfQ1lDTEVTKTsKPiA+IC0gICAgIEdVRVNUX0FTU0VSVF9FUSh2Y3B1X3NoYXJlZF9pcnFf
Y291bnQsIDEpOwo+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IHRhcmdzLm92ZXJmbG93X2lycW51
bTsgaSsrKQo+ID4gKyAgICAgICAgICAgICB0ZXN0X3BtdV9ldmVudF9vdmVyZmxvdyhTQklfUE1V
X0hXX0NQVV9DWUNMRVMpOwo+ID4gKyAgICAgR1VFU1RfQVNTRVJUX0VRKHZjcHVfc2hhcmVkX2ly
cV9jb3VudCwgdGFyZ3Mub3ZlcmZsb3dfaXJxbnVtKTsKPiA+ICsKPiA+ICsgICAgIHZjcHVfc2hh
cmVkX2lycV9jb3VudCA9IDA7Cj4gPgo+ID4gLSAgICAgdGVzdF9wbXVfZXZlbnRfb3ZlcmZsb3co
U0JJX1BNVV9IV19JTlNUUlVDVElPTlMpOwo+ID4gLSAgICAgR1VFU1RfQVNTRVJUX0VRKHZjcHVf
c2hhcmVkX2lycV9jb3VudCwgMik7Cj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgdGFyZ3Mub3Zl
cmZsb3dfaXJxbnVtOyBpKyspCj4gPiArICAgICAgICAgICAgIHRlc3RfcG11X2V2ZW50X292ZXJm
bG93KFNCSV9QTVVfSFdfSU5TVFJVQ1RJT05TKTsKPiA+ICsgICAgIEdVRVNUX0FTU0VSVF9FUSh2
Y3B1X3NoYXJlZF9pcnFfY291bnQsIHRhcmdzLm92ZXJmbG93X2lycW51bSk7Cj4gPgo+ID4gICAg
ICAgR1VFU1RfRE9ORSgpOwo+ID4gIH0KPiA+IEBAIC02MjEsOCArNjI3LDExIEBAIHN0YXRpYyB2
b2lkIHRlc3Rfdm1fZXZlbnRzX292ZXJmbG93KHZvaWQgKmd1ZXN0X2NvZGUpCj4gPgo+ID4gIHN0
YXRpYyB2b2lkIHRlc3RfcHJpbnRfaGVscChjaGFyICpuYW1lKQo+ID4gIHsKPiA+IC0gICAgIHBy
X2luZm8oIlVzYWdlOiAlcyBbLWhdIFstdCA8dGVzdCBuYW1lPl1cbiIsIG5hbWUpOwo+ID4gKyAg
ICAgcHJfaW5mbygiVXNhZ2U6ICVzIFstaF0gWy10IDx0ZXN0IG5hbWU+XSBbLW4gPG51bWJlciBv
ZiBMQ09GSSBpbnRlcnJ1cHQgZm9yIG92ZXJmbG93IHRlc3Q+XVxuIiwKPiA+ICsgICAgICAgICAg
ICAgbmFtZSk7Cj4gPiAgICAgICBwcl9pbmZvKCJcdC10OiBUZXN0IHRvIHJ1biAoZGVmYXVsdCBh
bGwpLiBBdmFpbGFibGUgdGVzdHMgYXJlICdiYXNpYycsICdldmVudHMnLCAnc25hcHNob3QnLCAn
b3ZlcmZsb3cnXG4iKTsKPiA+ICsgICAgIHByX2luZm8oIlx0LW46IE51bWJlciBvZiBMQ09GSSBp
bnRlcnJ1cHQgdG8gdHJpZ2dlciBmb3IgZWFjaCBldmVudCBpbiBvdmVyZmxvdyB0ZXN0IChkZWZh
dWx0OiAlZClcbiIsCj4gPiArICAgICAgICAgICAgIFNCSV9QTVVfT1ZFUkZMT1dfSVJRTlVNX0RF
RkFVTFQpOwo+ID4gICAgICAgcHJfaW5mbygiXHQtaDogcHJpbnQgdGhpcyBoZWxwIHNjcmVlblxu
Iik7Cj4gPiAgfQo+ID4KPiA+IEBAIC02MzEsNiArNjQwLDggQEAgc3RhdGljIGJvb2wgcGFyc2Vf
YXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ID4gICAgICAgaW50IG9wdDsKPiA+ICAgICAg
IGludCB0ZW1wX2Rpc2FibGVkX3Rlc3RzID0gU0JJX1BNVV9URVNUX0JBU0lDIHwgU0JJX1BNVV9U
RVNUX0VWRU5UUyB8IFNCSV9QTVVfVEVTVF9TTkFQU0hPVCB8Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNCSV9QTVVfVEVTVF9PVkVSRkxPVzsKPiA+ICsgICAgIGludCBvdmVy
Zmxvd19pbnRlcnJ1cHRzID0gLTE7Cj4KPiBJbml0aWFsaXppbmcgdG8gLTEgbWFkZSBtZSB0aGlu
ayB0aGF0ICctbiAwJyB3b3VsZCBiZSB2YWxpZCBhbmQgYSB3YXkgdG8KPiBkaXNhYmxlIHRoZSBv
dmVyZmxvdyB0ZXN0LCBidXQuLi4KPgoKSXMgdGhlcmUgYW55IGJlbmVmaXQgPyBJIGZvdW5kIGl0
IG11Y2ggbW9yZSBjb252ZW5pZW50IHRvIHNlbGVjdCBhCnNpbmdsZSB0ZXN0IGFuZCBydW4gaW5z
dGVhZCBvZiBkaXNhYmxpbmcKYSBzaW5nbGUgdGVzdC4KCk9uY2UgeW91IHNpbmdsZSBvciBhIHNl
dCBvZiB0ZXN0cywgYWxsIG90aGVyIHRlc3RzIGFyZSBkaXNhYmxlZCBhbnl3YXlzLgoKPiA+ICsK
PiA+ICAgICAgIHdoaWxlICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJoOnQ6bjoiKSkgIT0g
LTEpIHsKPiA+ICAgICAgICAgICAgICAgc3dpdGNoIChvcHQpIHsKPiA+ICAgICAgICAgICAgICAg
Y2FzZSAndCc6Cj4gPiBAQCAtNjQ2LDEyICs2NTcsMjQgQEAgc3RhdGljIGJvb2wgcGFyc2VfYXJn
cyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBkb25lOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHRhcmdzLmRpc2FibGVkX3Rl
c3RzID0gdGVtcF9kaXNhYmxlZF90ZXN0czsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICsgICAgICAgICAgICAgY2FzZSAnbic6Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
b3ZlcmZsb3dfaW50ZXJydXB0cyA9IGF0b2lfcG9zaXRpdmUoIk51bWJlciBvZiBMQ09GSSIsIG9w
dGFyZyk7Cj4KPiAuLi5oZXJlIHdlIHVzZSBhdG9pX3Bvc2l0aXZlKCkgYW5kLi4uCj4KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAgY2FzZSAnaCc6Cj4g
PiAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ290byBk
b25lOwo+ID4gICAgICAgICAgICAgICB9Cj4gPiAgICAgICB9Cj4gPgo+ID4gKyAgICAgaWYgKG92
ZXJmbG93X2ludGVycnVwdHMgPiAwKSB7Cj4KPiAuLi5oZXJlIHdlIG9ubHkgY2hhbmdlIGZyb20g
dGhlIGRlZmF1bHQgb2YgNSBmb3Igbm9uemVyby4KPgo+IFNob3VsZCB3ZSBhbGxvdyAnLW4gMCc/
IE90aGVyd2lzZSBvdmVyZmxvd19pbnRlcnJ1cHRzIGNhbiBiZSBpbml0aWFsaXplZAo+IHRvIHpl
cm8gKG5vdCB0aGF0IGl0IG1hdHRlcnMpLgo+CgpJIHdpbGwgY2hhbmdlIHRoZSBkZWZhdWx0IHZh
bHVlIHRvIDAgdG8gYXZvaWQgYW1iaWd1aXR5IGZvciBub3cuClBsZWFzZSBsZXQgbWUga25vdyBp
ZiB5b3Ugc3Ryb25nbHkgdGhpbmsgd2Ugc2hvdWxkIHN1cHBvcnQgLW4gMC4KV2UgY2FuIGFsd2F5
cyBzdXBwb3J0IGl0LiBJIGp1c3QgZG9uJ3Qgc2VlIHRoZSBwb2ludCBvZiBzcGVjaWZ5aW5nIHRo
ZQp0ZXN0IHdpdGggb3B0aW9ucyB0byBkaXNhYmxlIGl0IGFueW1vcmUuCgo+ID4gKyAgICAgICAg
ICAgICBpZiAodGFyZ3MuZGlzYWJsZWRfdGVzdHMgJiBTQklfUE1VX1RFU1RfT1ZFUkZMT1cpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl9pbmZvKCItbiBvcHRpb24gaXMgb25seSBhdmFp
bGFibGUgZm9yIG92ZXJmbG93IHRlc3RcbiIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdv
dG8gZG9uZTsKPiA+ICsgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICB0YXJncy5vdmVyZmxvd19pcnFudW0gPSBvdmVyZmxvd19pbnRlcnJ1cHRzOwo+ID4gKyAg
ICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
ICBkb25lOgo+ID4gICAgICAgdGVzdF9wcmludF9oZWxwKGFyZ3ZbMF0pOwo+ID4gQEAgLTY2MSw2
ICs2ODQsNyBAQCBzdGF0aWMgYm9vbCBwYXJzZV9hcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10p
Cj4gPiAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiA+ICB7Cj4gPiAgICAgICB0
YXJncy5kaXNhYmxlZF90ZXN0cyA9IDA7Cj4gPiArICAgICB0YXJncy5vdmVyZmxvd19pcnFudW0g
PSBTQklfUE1VX09WRVJGTE9XX0lSUU5VTV9ERUZBVUxUOwo+ID4KPiA+ICAgICAgIGlmICghcGFy
c2VfYXJncyhhcmdjLCBhcmd2KSkKPiA+ICAgICAgICAgICAgICAgZXhpdChLU0ZUX1NLSVApOwo+
ID4KPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
