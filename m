From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 23 Jan 2023 16:57:32 +0100
Subject: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
In-Reply-To: <20230123094405.2ageo63zauqt6g2n@orel>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com> <Y85A+3MW2N/jPTHH@wendy>
 <20230123094405.2ageo63zauqt6g2n@orel>
Message-ID: <934c637b-9ca2-34be-ce64-2a7639de6490@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/01/2023 10:44, Andrew Jones wrote:
> On Mon, Jan 23, 2023 at 08:10:35AM +0000, Conor Dooley wrote:
>> Hey,
>>
>> On Sun, Jan 22, 2023 at 08:13:24PM +0100, Andrew Jones wrote:
>>> The Zicboz operates on a block-size defined for the cpu-core,
>>> which does not necessarily match other cache-sizes used.
>>>
>>> So add the necessary property for the system to know the core's
>>> block-size.
>>>
>>> Cc: Rob Herring <robh@kernel.org>
>>
>> FYI bindings need to be CC Krzysztof & the devicetree list too.
> 
> Thanks, hopefully CC'ing them now is OK (I just added them). If not,
> I can repost.
> 

It does not work like this. I don't have the patch in my inbox. How it
should magically appear there?

Also how do you expect the bot to get it?

You need to use get_maintainers.pl *always*. Please resend.

Best regards,
Krzysztof


